module ActiveTrail
  class WorkflowEngine

    PROTO = 'http'
    HOST = 'localhost'
    PORT = 7007

    def self.engine(res, verb = :get, opts = {})

      begin

        uri = "#{PROTO}://#{HOST}:#{PORT}/#{res}"
        res = JSONClient.new.send(verb, uri, opts)

        # todo do domething with the res if HTTP code is 400!
      rescue Errno::ECONNREFUSED => e
        raise LaunchError.new(e.message)
      end
    end

    def self.process(exid)

      res = engine('executions')
      execs = res.content['_embedded']

      execs.find { |exe| exe['exid'] == exid }
    end

    def self.processes(opts = {})

      # engine.processes(opts) # TODO
    end

    def self.launch(pdef, fields={})

      res = engine('message', :post, { point: 'launch', tree: pdef, fields: fields } )
      res.content['exid']
    end

    def self.return(exid, nid, payload)

      engine('message', :post, { point: 'reply', exid: exid, nid: nid, payload: payload } )
    end

    def self.register_participant(regex, handler)

      # engine.register(regex, handler) # TODO
    end

    def self.register_participant_list(plist)

      # engine.participant_list= plist # TODO
    end

    class LaunchError < Exception
      def initialize(error)

        super("#{error}")
      end
    end
  end
end