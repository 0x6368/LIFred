require './constants'

def get_preference(alfred, key, default_value = '')
  # Get the settings
  settings = alfred.setting.load

  # Check whether the key does not exist
  if alfred.setting.has_key?(key)
    settings[key]
  else
    default_value
  end
end

def set_preference(alfred, key, value)
  # Get the settings
  settings = alfred.setting.load

  # Set the value
  settings[key] = value

  # Save the client token
  alfred.setting.dump(settings)
end

def toggle_preference(alfred, key)
  set_preference(alfred, key, get_preference(alfred, key, 'yes') == 'yes' ? 'no' : 'yes')
end

def get_bulbs()
  # Check whether there is json file
  if File.file?(BULBS_FILE_NAME)
    # Open the file
    file = File.open(BULBS_FILE_NAME, 'rb')

    # Read the files content
    contents = file.read.strip

    # Close the file
    file.close

    # Check whether there is any content
    if contents && contents != ''
      # Parse the json file
      bulbs = JSON.parse(contents, {:symbolize_names => true})
    else
      bulbs = {}
    end

    return bulbs
  end
end