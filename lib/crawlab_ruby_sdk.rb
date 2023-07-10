require "crawlab_ruby_sdk/version"
require "grpc"
require "json"
def traverse_dir(file_path)
  if File.directory? file_path
    Dir.foreach(file_path){|file| traverse_dir(file_path+"/"+file) if file!="." and file!=".." }
  else
    load file_path if file_path.to_s.match(/\.rb$/)
  end
end

dir = File.expand_path("..", __FILE__)

# puts dir

traverse_dir(dir+'/entity/stream_message_code_pb.rb')
traverse_dir(dir+'/entity/stream_message_pb.rb')
traverse_dir(dir+'/client')

module CrawlabRubySdk
  class Error < StandardError; end
  # Your code goes here...

  
  def self.save_item(item={})
    address = ENV["CRAWLAB_GRPC_ADDRESS"]
    if address==nil || address == ""
      address = "localhost:9666"
    end  

    auth = ENV["CRAWLAB_GRPC_AUTH_KEY"]
    if auth==nil || auth == ""
      auth = "Crawlab2021!"
    end  
    
    client = TaskServiceClient.new(address,auth)

    sub_client = client.subscribe

    save(sub_client,[item])
  end

  def self.save_items(items=[])
    address = ENV["CRAWLAB_GRPC_ADDRESS"]
    if address==nil || address == ""
      address = "localhost:9666"
    end  

    auth = ENV["CRAWLAB_GRPC_AUTH_KEY"]
    if auth==nil || auth == ""
      auth = "Crawlab2021!"
    end  
    
    client = TaskServiceClient.new(address,auth)

    sub_client = client.subscribe

    save(sub_client,items)    
  end

  def self.save(sub_client,items = [])
    results = []

    items.each do |item|
      results << item

      if results.size >= 50
        _save(sub_client,results)
      end
      
    end

    if results.size > 0
      _save(sub_client,results)
    end
  end

  def self._save(sub_client,items=[])
    records = []
    task_id = get_task_id
    if task_id == nil || task_id == ""
      return
    end

    items.each do |item|
      item["_tid"] = task_id
      records << item
    end

    data = {task_id: task_id,data:records}.to_json.b
    # data = data.encode("utf-8")
    # puts data

    # data = data.encode('ASCII-8BIT', invalid: :replace, undef: :replace, replace: '')
    # puts data

    msg = Grpc::StreamMessage.new(code:3,data:data)

    sub_client.Send([msg]) 
  end

  def self.get_task_id
    task_id = ENV["CRAWLAB_TASK_ID"]
    if task_id == nil || task_id == ""
      task_id = "6486e256fa1cb07a47c09adf"
    end
    return task_id
  end

  def self.save_file_to_oss(oss_path,file_path)
    OssServerClient.new.send(oss_path,file_path)
  end

  def self.save_file_stream_to_oss(oss_path,stream)
    OssServerClient.new.send_stream(oss_path,stream)
  end
end