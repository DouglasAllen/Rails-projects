

   create_table :system_settings do |t|
      t.string  :name
      t.string  :label
      t.text    :value
      t.string  :type
      t.integer :position
    end
    # errorsome yet
    SystemSetting.create  name:  'notice', label: 'Use notice?', value: 1