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
traverse_dir(dir+'/entity/result_pb.rb')
traverse_dir(dir+'/entity/stream_message_pb.rb')
traverse_dir(dir+'/entity/stream_message_data_task_pb.rb')
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

    # task_id = ENV["CRAWLAB_TASK_ID"]
    # if task_id == nil || task_id == ""
    #   task_id = "6486e256fa1cb07a47c09adf"
    # end
    # item = {"hello": "world","_tid":task_id}
    # item["_tid"] = task_id
    # item = Grpc::Result.new({"_tid":task_id,"name":"lala","age":"12"})

    # data = Grpc::StreamMessageDataTask.new()
    # # puts item

    # data.task_id = task_id
    # data.data.push(item)

    # puts data
    # msg = Grpc::StreamMessage.new(code:3,data:data.to_json)
    # puts msg
    # sub_client.Send([msg])    
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

    data = {task_id: task_id,data:records}.to_json

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
end