%% Main_1_rdf_and_boo_calculation_all_atoms
% calculate the radial distribution functions and bond orientation order
% with all atoms inside the metallic glass nanoparticle

addpath('src/')
addpath('input/')

% read in files: finalized atomic coordinates in Angstrom and types
model = importdata('./Input/Final_atomic_model_anneal_30min_GST');
atoms = importdata('./Input/Final_atomtype_anneal_30min_GST.mat');

% set the parameters: step size and the range for rdf and pdf
step = 0.1;  cutoff = 10;

% calculate the alpha shape of the nanoparticle
submodel = model - repmat(min(model,[],2),[1,size(model,2)]) + ones(size(model));
submodel = double(submodel);
shp      = alphaShape(submodel(1,:)',submodel(2,:)',submodel(3,:)',4);

% initialize a spherical index for later intersection calculation
[vMat,~] = spheretri(5000);
nsample  = size(vMat,1);

% initialize the radial distance and g(r) array for rdf
radius_arr = 0:step:cutoff;
rdf_arr    = zeros([size(radius_arr,2),1]);
volume_arr = zeros([size(radius_arr,2),1]);
pdf_arr    = zeros([size(radius_arr,2),3,3]);

% perform the main part for rdf and pdf calculation
for i=1:size(submodel,2)
    disp(num2str(i));
    
    temp_atom_arr   = atoms;
    temp_label      = temp_atom_arr(i);
    rdf_arr_temp    = zeros([size(radius_arr,2),1]);
    volume_arr_temp = zeros([size(radius_arr,2),1]);
    pdf_arr_temp    = zeros([size(radius_arr,2),3,3]);
    
    for j = 1:size(submodel,2)
        
        dis = submodel(:,i) - submodel(:,j);
        dis = norm(dis,2);
        % for each pair, calculate the pair distribution and accumulate the
        % number to corresponding array postion
        if dis < cutoff
            ind = ceil(dis/step+0.01);
            rdf_arr_temp(ind) = rdf_arr_temp(ind)+1;
            pdf_arr_temp(ind,temp_label,temp_atom_arr(j)) = ...
                pdf_arr_temp(ind,temp_label,temp_atom_arr(j)) + 1;
        end
        
    end
    
    % calculate the intersection between the spherical volume with
    % nanoparticle as the scaled factor
    for j = 0:step:cutoff
        spoints = vMat*(j+step/2)+repmat(submodel(:,i)',[size(vMat,1),1]);
        in = inShape(shp,spoints(:,1),spoints(:,2),spoints(:,3));
        ind = round(j/step)+1;
        volume_arr_temp(ind) = sum(in) / nsample * ( 4/3 * pi() * ((j+step)^3-j^3) );
    end
    
    rdf_arr = rdf_arr + rdf_arr_temp;
    pdf_arr = pdf_arr + pdf_arr_temp;
    volume_arr = volume_arr + volume_arr_temp;
    
end

save('./OutPut/RDF_anneal_30min_GST.mat','radius_arr','rdf_arr','pdf_arr')
