package com.yasser.gitops.api;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.Map;

@RestController
@RequestMapping("/api/platform")
public class PlatformController {
    private final Counter requestCounter;

    @Value("${app.environment:local}")
    private String environment;

    @Value("${app.version:dev}")
    private String version;

    public PlatformController(MeterRegistry meterRegistry) {
        this.requestCounter = Counter.builder("demo_api_platform_requests_total")
            .description("Total calls to the platform demo endpoint")
            .register(meterRegistry);
    }

    @GetMapping
    public Map<String, Object> platform() {
        requestCounter.increment();
        return Map.of(
            "service", "demo-api",
            "environment", environment,
            "version", version,
            "gitops", true,
            "timestamp", Instant.now().toString()
        );
    }
}
