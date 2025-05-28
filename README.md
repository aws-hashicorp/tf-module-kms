# Terraform AWS KMS Module

Este módulo de Terraform crea una clave KMS y un alias en AWS.

## Recursos

- `aws_kms_key`: Crea una clave KMS con rotación habilitada y configuración personalizada.
- `aws_kms_alias`: Crea un alias para la clave KMS.

## Ejemplo de uso

```hcl
module "kms" {
    source                    = "ruta/al/modulo"
    key_description           = "Clave KMS para cifrado"
    deletion_window_in_days   = 30
    key_usage                 = "ENCRYPT_DECRYPT"
    customer_master_key_spec  = "SYMMETRIC_DEFAULT"
    kms_key_policy            = data.aws_iam_policy_document.kms_policy.json
    alias_name                = "alias/mi-clave"
    tags                      = {
        Environment = "dev"
    }
}
```

## Variables

| Nombre                       | Descripción                                 | Tipo     | Requerido |
|------------------------------|---------------------------------------------|----------|-----------|
| `key_description`            | Descripción de la clave KMS                 | string   | Sí        |
| `deletion_window_in_days`    | Días antes de eliminar la clave             | number   | Sí        |
| `key_usage`                  | Uso de la clave (ej: ENCRYPT_DECRYPT)       | string   | Sí        |
| `customer_master_key_spec`   | Especificación de la clave                  | string   | Sí        |
| `kms_key_policy`             | Política de la clave KMS                    | string   | Sí        |
| `alias_name`                 | Nombre del alias (ej: alias/mi-clave)       | string   | Sí        |
| `tags`                       | Etiquetas adicionales                      | map      | No        |

## Salidas

| Nombre         | Descripción                         |
|----------------|-------------------------------------|
| `kms_key_id`   | ID de la clave KMS                  |
| `kms_alias_arn`| ARN del alias de la clave KMS       |

## Licencia

MIT