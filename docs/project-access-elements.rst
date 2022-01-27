.. mdinclude:: ../project_access_elements/README.md

Example
----------

Required: `camptocamp/terraform-provider-pass <https://github.com/camptocamp/terraform-provider-pass>`_

.. code-block:: terraform
    :caption: Create a SSH Key from given pass path
    :name: example-module-project_access_elements

    module "management_access_key" {
      source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//project_access_elements?ref=v0.0.5.dev"

      name      = "management_key"
      pass_path = "${var.machine_access_pass_path}"
      labels = {
        usage = "machine"
      }
    }

For more Information take a look to the source at ``project_access_elements/main.tf`` and ``project_access_elements/variables.tf``
