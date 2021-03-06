#!/bin/bash
## Usage: ./document-management-store-get.sh documentId versionId
##
## Get the file from DM store.
## documentId - UUID identifying the resource
##

documentId=$1
versionId=$2
binFolder=$(dirname "$0")

userToken="$(${binFolder}/idam-user-token.sh ccd-import 1)"
serviceToken="$(${binFolder}/idam-service-token.sh ccd_gw)"

curl -XPOST --verbose \
  http://localhost:4603/documents/${documentId}/versions/${versionId}/migrate \
  -H "Authorization: Bearer ${userToken}" \
  -H "ServiceAuthorization: ${serviceToken}"
