prepare_cloud_profiles:
	python tools/generate_provider_profiles.py

deploy_create_sg_kbr_saltstack_global:
	nova secgroup-create kbr_saltstck_global "allow nodes managed with salstack to communicate" && \
	nova secgroup-add-rule kbr_saltstck_global tcp 4505 4506 0.0.0.0/0 ;


deploy_create_sg_kbr_ssh_access:
	nova secgroup-create kbr_ssh_access "allow ssh access to kubernetes nodes and containers" && \
	nova secgroup-add-group-rule kbr_ssh_access kbr_ssh_access tcp 22 22 ;

deploy_create_sg_kbr_internal:
	nova secgroup-create kbr_internal_access "allow intrnal traffic between kubernetes nodes";

deploy_create_sg_kbr_external:
	nova secgroup-create kbr_internal_access "allow intrnal traffic between kubernetes nodes";
