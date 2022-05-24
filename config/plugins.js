module.exports = ({ env }) => ({
  upload: {
    config: {
      provider: "@strapi-community/strapi-provider-upload-google-cloud-storage",
      providerOptions: {
        bucketName: env("UPLOAD_GCS_BUCKET_NAME"),
        publicFiles: false,
        uniform: false,
        basePath: "",
      },
    },
  },
});
