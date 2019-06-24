# alt-radiator

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

NOTE: Whereever you host this, the following routes must reverse proxy to your jenkins host:
```
/api/*
/view/*
/job/*
```

For `npm run serve`, add the following to your `/vue.config.js`:
```
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
```