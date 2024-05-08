package vn.edu.hcmuaf.fit.connection_pool;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.SQLException;

import org.jdbi.v3.core.Jdbi;

public class JDBIConnector {
    private static JDBIConnector instance;
    private static Jdbi jdbi;

    public JDBIConnector() {
        super();
    }

    private static HikariDataSource createDataSource() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://" + DbProperties.host + ":" + DbProperties.port + "/" + DbProperties.dbname);
        config.setUsername(DbProperties.username);
        config.setPassword(DbProperties.password);
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(5);
        config.setIdleTimeout(300000);
        config.setConnectionTimeout(30000);
        config.setLeakDetectionThreshold(5000);
        return new HikariDataSource(config);
    }

    public static Jdbi get() {
        if (jdbi == null) {
            HikariDataSource ds = createDataSource();
            jdbi = Jdbi.create(ds);
        }
        return jdbi;
    }
}