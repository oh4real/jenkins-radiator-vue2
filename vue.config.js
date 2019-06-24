module.exports = {
    lintOnSave: true,
    devServer: {
        proxy: {
            '/api': {
                target: 'http://yourjenkins.dev',
                changeOrigin: true
            },
            '/view': {
                target: 'http://yourjenkins.dev',
                changeOrigin: true
            },
            '/job': {
                target: 'http://yourjenkins.dev',
                changeOrigin: true
            }
        }
    }
}