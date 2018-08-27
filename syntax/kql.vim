if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case ignore

" https://docs.loganalytics.io/docs/Language-Reference/

" Basic operators
syntax match kqlOperator "[-!|&+<>=/*]"
syntax match kqlOperator "\vand"
syntax match kqlOperator "\vor"
syntax match kqlOperator "\vin"
syntax match kqlOperator "\v!in"
" Numbers
syntax match kqlNumber "\v[0-9]+"
" Tabular operators
syntax keyword kqlKeyword as consume count datatable distinct evaluate extend facet find fork getschema invoke join limit make-series materialize function mvexpand order project project-away project-rename parse print range reduce render sample sample-distinct search serialize sort summarize take top top-nested top-hitters union where
" Tabular operators evaluate functions
syntax keyword kqlKeyword autocluster bag_unpack basket dcount_intersect diffpatterns narrow pivot preview rolling_percentile
" Tabular operators join
syntax keyword kqlKeyword on kind innerunique inner leftouter rigtouter fullouter leftanti rightanti leftantisemi rightantisemi leftsemi rightsemi
" Tabular operators summarize
syntax keyword kqlKeyword on by bin
" Special functions
syntax keyword kqlKeyword table app workspace toscalar
" Scalar functions
syntax keyword kqlKeyword abs acos ago array_concat array_length asin atan atan2 base64_decodestring base64_encodestring beta_cdf beta_inv beta_pdf bin bin_at bin_auto binary_and binary_not binary_or binary_shift_left binary_shift_right binary_xor case ceiling coalesce columnifexists cos cot countof datetime_add datetime_part datetime_diff dayofmonth dayofweek dayofyear dcount_hll degrees endofday endofmonth endofweek endofyear estimate_data_size exp exp10 exp2 extract extractall extractjson floor format_datetime format_timespan gamma getmonth gettype getyear hash hash_sha256 hll_merge hourofday iif indexof ingestion_time isempty isfinite isinf isnan isnotempty, notempty isnotnull, notempty isnull log log10 log2 loggamma make_datetime make_timespan max_of min_of monthofyear not now pack pack_all pack_array parse_ipv4 parse_json parse_path parse_url parse_urlquery parse_user_agent parse_version parse_xml percentile_tdigest percentrank_tdigest pi pow radians rand range rank_tdigest repeat replace reverse round series_add series_divide series_fill_backward series_fill_const series_fill_forward series_fill_linear series_fir series_fit_2lines series_fit_2lines_dynamic series_fit_line series_fit_line_dynamic series_iir series_multiply series_outliers series_periods_detect series_periods_validate series_seasonal series_stats series_stats_dynamic series_subtract sign sin split sqrt startofday startofmonth startofweek startofyear strcat strcat_array strcat_delim strcmp strlen strrep substring tan tdigest_merge tobool todatetime todecimal todouble todynamic toguid tohex toint tolong tolower toreal tostring totimespan toupper translate treepath trim trim_end trim_start url_decode url_encode weekofyear welch_test zip
" Aggregation functions
syntax keyword kqlKeyword any arg_max arg_min avg avgif buildschema count countif dcount dcountif hll hll_merge makelist makeset make_dictionary max min percentiles stdev stdevif stdevp sum sumif tdigest tdigest_merge variance varianceif variancep
" Window functions
syntax keyword kqlKeyword next prev row_cumsum row_number rolling_percentile 
" Time Series
syntax keyword kqlKeyword evaluate autocluster basket diffpatterns make-series series_add series_divide series_fill_backward series_fill_const series_fill_forward series_fill_linear series_fir series_fit_line series_fit_line_dynamic series_fit_2lines series_fit_2lines_dynamic series_iir series_multiply series_outliers series_periods_detect series_periods_validate series_seasonal series_stats series_stats_dynamic series_subtract
" Scalar data types
syntax keyword kqlKeyword bool boolean datetime date dynamic guid uuid, uniqueid int long real double string timespan time decimal
" Query statements
syntax keyword kqlKeyword let restrict access to
" Strings
syntax region kqlString start=/\v"/ skip=/\v\\"/ end=/\v"/
syntax region kqlString start=/\v'/ skip=/\v\\'/ end=/\v'/
" Comments
syntax match kqlComment "\v\/\/.*$"

" Highlight
highlight link kqlOperator Operator
highlight link kqlNumber Number
highlight link kqlKeyword Keyword
highlight link kqlString String
highlight link kqlComment Comment

let b:current_syntax = "kql"
