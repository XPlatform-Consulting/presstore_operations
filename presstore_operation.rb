class PresstoreOperation < ActiveRecord::Base
  include Action

  # Default Values

  DEFAULT_HOST_ADDRESS  = 'localhost'
  DEFAULT_HOST_PORT     = '9001'
  DEFAULT_USERNAME      = 'admin'
  DEFAULT_PASSWORD      = 'password'

  DEFAULT_NSDCHAT_CMD_PATH      = '/usr/local/aw/bin/nsdchat'
  DEFAULT_CLIENT_NAME           = 'localhost'
  DEFAULT_ARCHIVE_PLAN_ID       = '10001'
  DEFAULT_ARCHIVE_DATABASE_NAME = 'Default-Archive'

  # Input Parameters

  VAR_EXECUTION_NODE    = 'Execution node'
  VAR_SOURCE_FILE_PATH  = 'File path'
  VAR_HOST_ADDRESS      = 'PresSTORE host address'
  VAR_HOST_PORT         = 'PresSTORE host port'
  VAR_USERNAME          = 'PresSTORE username'
  VAR_PASSWORD          = 'PresSTORE password'

  VAR_OPERATION = 'operation'
  OPERATION_ARCHIVE   = 'archive'
  OPERATION_RESTORE   = 'restore'
  OPERATION_LIST = [ OPERATION_ARCHIVE, OPERATION_RESTORE ]

  # Output Fields
  # TODO Add Output Fields


  # Revision history
  # => 0.0.1 initial release
  def self.version
    return 0, 0, 1
  end

  def self.display_name
    'PresSTORE'
  end

  # The Plug-in Description
  def description
    'This action plug-in can be used to interact with Archiware\'s PresSTORE application.'
  end

  def category
    [ CATEGORY_INTEGRATION ]
  end

  def self.dependencies
    [ ]
  end

  def inputs_spec
    @required_inputs = {}
    @optional_inputs = { VAR_SOURCE_FILE_PATH => TYPE_STRING }

    return @required_inputs, @optional_inputs
  end

  def outputs_spec
    return { VAR_SOURCE_FILE_PATH => TYPE_STRING }
  end

  def execute

  end

  def execution_node_get
    execution_node.blank? ? RemoteNode.find_by_name( @inputs[VAR_EXECUTION_NODE] ) : execution_node
  end

end