Project Access Elements Module
==================

Required: `camptocamp/terraform-provider-pass <https://github.com/camptocamp/terraform-provider-pass>`_

.. code-block:: terraform
    :caption: Create a SSH Key from given pass path
    :name: example-module-project_access_elements

    module "management_access_key" {
      source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//project_access_elements?ref=v0.0.4.dev"

      name      = "management_key"
      pass_path = "${var.machine_access_pass_path}"
      labels = {
        usage = "machine"
      }
    }

For more Information take a look to the source at ``project_access_elements/main.tf`` and ``project_access_elements/variables.tf``

Storage Elements Module
==================

.. code-block:: terraform
    :caption: Handle a Storage Volume
    :name: example-module-storage_elements

    module "minio_storage_runtime" {
      source       = "git::https://github.com/nolte/terraform-infrastructure-modules.git//storage_elements?ref=v0.0.4.dev"

      storage_name = "minio_storage_runtime"
      storage_size = 30
      storage_labels = {
        service = "storagebox"
        type    = "runtime_storage"
      }
    }

For more Information take a look to the source at ``storage_elements/main.tf`` and ``storage_elements/variables.tf``

Computing Elements Module
==================

Crate a Ready For Configure VM, with mounted Volues and preconfigured Ansible User (ready for, `nolte/ansible_playbook-baseline-online-server <https://github.com/nolte/ansible_playbook-baseline-online-server>`_).

.. code-block:: terraform
    :caption: handle a reconfigured computing instance
    :name: example-module-computing_elements

    module "minio_computing_elements" {
      source                                           = "git::https://github.com/nolte/terraform-infrastructure-modules.git//computing_elements?ref=v0.0.4.dev"

      computing_instance_name                          = "${var.minio_computing_instance_name}"
      computing_instance_usage_root_key                = "${data.hcloud_ssh_key.machine_key.id}"
      computing_instance_labels                        = "${local.merged_minio_computing_instance_labels}"
      computing_instance_ssh_machine_key_id_var        = "${data.hcloud_ssh_key.machine_key.public_key}"
      computing_instance_ssh_private_key_id_var        = "${data.hcloud_ssh_key.private_key.public_key}"
      computing_instance_additional_volumes_cloud_init = "${data.template_file.cloudinit_mounts.rendered}"
    }

you will find some example used in `nolte/personal-storage-infrastructure <https://github.com/nolte/personal-storage-infrastructure>`_ or `nolte/minecraft-infrastructure <https://nolte.github.io/minecraft-infrastructure/index.html>`_.

Ansible User
----------


.. literalinclude:: ../computing_elements/cloudinit_templates/cloudinit users.yml.tp
   :language: yaml



SSHD Config
----------

.. literalinclude:: ../computing_elements/cloudinit_templates/cloudinit_files.yml.tp
   :language: yaml


Volumes
----------




For more Information take a look to the source at ``computing_elements/main.tf`` and ``computing_elements/variables.tf``
