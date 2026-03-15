module.exports = {
    apps: [
        {
            name: "midterm-devops",
            script: "./src/main.js",
            instances: 1,           // Run 1 instance (can increase if load balancing is needed)
            autorestart: true,
            watch: false,
            max_memory_restart: "1G",
            env: {
                NODE_ENV: "production",
                PORT: 3000
            },
            // Use the log directories created in setup.sh in Phase 1
            error_file: "/var/www/app/logs/err.log",
            out_file: "/var/www/app/logs/out.log",
            log_date_format: "YYYY-MM-DD HH:mm:ss"
        }
    ]
};