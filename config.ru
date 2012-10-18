app =
  lambda do |env|
    body = (["FOO:#{ENV["FOO"]}"] + ENV.map { |k,v| "#{k}=#{v}" }).join("\n")
    headers = {
      'Content-Length' => body.length.to_s,
      'Content-Type'   => 'text/plain'}
    [200, headers, [body]]
  end
run app
