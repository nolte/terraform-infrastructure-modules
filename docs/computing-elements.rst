.. mdinclude:: ../computing_elements/README.md

Example
----------

Crate a Ready For Configure VM, with mounted Volues and preconfigured Ansible User (ready for, `nolte/ansible_playbook-baseline-online-server <https://github.com/nolte/ansible_playbook-baseline-online-server>`_).

.. code-block:: terraform
    :caption: handle a reconfigured computing instance
    :name: example-module-computing_elements

    module "minio_computing_elements" {
      source                                           = "git::https://github.com/nolte/terraform-infrastructure-modules.git//computing_elements?ref=v0.0.5.dev"

      computing_instance_name                          = "${var.minio_computing_instance_name}"
      computing_instance_usage_root_key                = "${data.hcloud_ssh_key.machine_key.id}"
      computing_instance_labels                        = "${local.merged_minio_computing_instance_labels}"
      computing_instance_ssh_machine_key_id_var        = "${data.hcloud_ssh_key.machine_key.public_key}"
      computing_instance_ssh_private_key_id_var        = "${data.hcloud_ssh_key.private_key.public_key}"
      computing_instance_additional_volumes_cloud_init = "${data.template_file.cloudinit_mounts.rendered}"
    }

you will find some example used in `nolte/personal-storage-infrastructure <https://github.com/nolte/personal-storage-infrastructure>`_ or `nolte/minecraft-infrastructure <https://nolte.github.io/minecraft-infrastructure/index.html>`_.



Ansible User
^^^^^^^^^^


.. literalinclude:: ../computing_elements/cloudinit_templates/cloudinit users.yml.tp
   :language: yaml



SSHD Config
^^^^^^^^^^

.. literalinclude:: ../computing_elements/cloudinit_templates/cloudinit_files.yml.tp
   :language: yaml
