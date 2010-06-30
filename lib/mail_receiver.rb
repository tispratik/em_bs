#require File.join(File.dirname(__FILE__), '..', 'config', 'environment')
require 'net/imap'
require 'net/http'
class MailReceiver < Struct.new()

  def perform
     start
  end

  def start
        config = YAML.load(File.read(File.join(RAILS_ROOT, 'config', 'email.yml')))
        begin
          puts 'Checking for new mail'
          imap = Net::IMAP.new(config[:host], config[:url_port], true)
          imap.login(config[:user_name], config[:password])
          imap.select('Inbox')


           imap.uid_search(["NOT", "DELETED"]).each do |message_id|
             envelope = imap.uid_fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]

                puts "#{envelope.from[0].name}: \t#{envelope.subject}"

              msg = imap.uid_fetch(message_id,'RFC822')[0].attr['RFC822']
              mail = TMail::Mail.parse(msg)
              body = mail.body
              a = envelope.to[0].name.split(":")
              if "Task" == a[0]
                @comment = Comment.new
                 @taskid = Task.find_by_name(a[1])
                 @comment.commentable_id = @taskid,
                 @comment.commentable_type = "Task",
                 @comment.description = body
                 @comment.save
                imap.uid_copy(message_id, "[Gmail]/All Mail")
                imap.uid_store(message_id, "+FLAGS", [:Deleted])
              end

          end

          imap.expunge
          imap.logout
          imap.disconnect
        rescue Net::IMAP::NoResponseError => e
          puts "NoResponseError: #{e.message}"
        rescue Net::IMAP::ByeResponseError => e
          puts "ByeResponseError: #{e.message}"
        rescue => e
          puts "Error: #{e.message}"
        end
    end

end