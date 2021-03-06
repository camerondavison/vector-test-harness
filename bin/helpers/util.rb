SUBJECT_META = {
  'filebeat' => {
    name: "Filebeat"
  },
  'fluentbit' => {
    name: "FluentBit"
  },
  'fluentd' => {
    name: "FluentD"
  },
  'logstash' => {
    name: "Logstash"
  },
  'splunk_heavy_forwarder' => {
    name: "Splunk HF"
  },
  'splunk_universal_forwarder' => {
    name: "Splunk UF"
  },
  'vector' => {
    name: "Vector"
  }
}

TEST_META = {
  'file_to_tcp_performance' => {
    name: 'File To TCP',
    description: 'A file tailing test, tailing 10 files and forwarding data over TCP'
  },
  'regex_parsing_performance' => {
    name: 'Regex Parsing',
    description: 'A Regex test, parsing Apache common log formats'
  },
  'tcp_to_blackhole_performance' => {
    name: 'TCP To Blackhole',
    description: 'A raw internal performance test, accepting data over TCP and discarding it'
  },
  'tcp_to_http_performance' => {
    name: 'TCP To HTTP',
    description: 'An HTTP performance test, accepting data over TCP and forwarding it over HTTP'
  },
  'tcp_to_tcp_performance' => {
    name: 'TCP To TCP',
    description: 'A TCP performance test, accepting data over TCP and forwarding it over TCP'
  }
}

def build_short_subject_name(name)
  case name
  when 'splunk_heavy_forwarder'
    'splunk_hf'
  when 'splunk_universal_forwarder'
    'splunk_uf'
  else
    name
  end
end

def fetch_subject_meta!(name)
  SUBJECT_META.fetch(name)
end

def fetch_test_meta!(name)
  TEST_META.fetch(name)
end

def filesize(size)
  units = ['b', 'kib', 'MiB', 'gib', 'tib', 'pib', 'eib']

  return '0.0 B' if size == 0
  exp = (Math.log(size) / Math.log(1024)).to_i
  exp = 6 if exp > 6 

  ('%.1f%s' % [size.to_f / 1024 ** exp, units[exp]]).gsub('.0', '')
end