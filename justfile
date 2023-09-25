_default:
    just --list

version := env_var_or_default("CONNECT_VERSION", "2023.09.0")

generate-r:
    openapi-generator generate \
    --input-spec https://docs.posit.co/connect/{{version}}/api/swagger.json \
    --generator-name r \
    --additional-properties generateWrapper \
    --additional-properties packageVersion={{version}} \
    --additional-properties exceptionPackage=rlang \
    --library httr2 \
    --output r/ \
    --package-name connectapi2 \
    --skip-validate-spec

generate-python:
    swagger-codegen generate \
    --input-spec https://docs.posit.co/connect/{{version}}/api/swagger.json \
    --lang python \
    --additional-properties packageVersion={{version}} \
    --additional-properties packageName=connectapi \
    -o python/
