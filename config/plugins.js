module.exports = {
  upload: {
    config: {
      provider: "@strapi-community/strapi-provider-upload-google-cloud-storage",
      providerOptions: {
        bucketName: "machinelearningsandbox-265814-strapi",
        publicFiles: false,
        uniform: false,
        basePath: "",
      },
    },
  },
};
