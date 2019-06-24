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