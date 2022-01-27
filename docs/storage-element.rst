.. mdinclude:: ../storage_elements/README.md

Example
----------

.. code-block:: terraform
    :caption: Handle a Storage Volume
    :name: example-module-storage_elements

    module "minio_storage_runtime" {
      source       = "git::https://github.com/nolte/terraform-infrastructure-modules.git//storage_elements?ref=v0.0.5.dev"

      storage_name = "minio_storage_runtime"
      storage_size = 30
      storage_labels = {
        service = "storagebox"
        type    = "runtime_storage"
      }
    }

For more Information take a look to the source at ``storage_elements/main.tf`` and ``storage_elements/variables.tf``

