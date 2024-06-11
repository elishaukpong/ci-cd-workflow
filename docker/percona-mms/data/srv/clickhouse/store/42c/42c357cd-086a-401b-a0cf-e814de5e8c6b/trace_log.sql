ATTACH TABLE _ UUID 'df747107-d36a-47ff-9a5c-31ad9fd2d600'
(
    `event_date` Date,
    `event_time` DateTime,
    `event_time_microseconds` DateTime64(6),
    `timestamp_ns` UInt64,
    `revision` UInt32,
    `trace_type` Enum8('Real' = 0, 'CPU' = 1, 'Memory' = 2, 'MemorySample' = 3, 'MemoryPeak' = 4, 'ProfileEvent' = 5),
    `thread_id` UInt64,
    `query_id` String,
    `trace` Array(UInt64),
    `size` Int64,
    `ptr` UInt64,
    `event` LowCardinality(String),
    `increment` Int64
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_date, event_time)
SETTINGS index_granularity = 8192
