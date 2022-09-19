local Saidibots_function, function_core, update_functions, Saidibots_timer = {}, {}, {}, {}
local Saidibots = {
  get_update = true,
  logo = [[

]],

colors_key = {
  reset =      0,
  bright     = 1,
  dim        = 2,
  underline  = 4,
  blink      = 5,
  reverse    = 7,
  hidden     = 8,
  black     = 30,
  red       = 31,
  green     = 32,
  yellow    = 33,
  blue      = 34,
  magenta   = 35,
  cyan      = 36,
  white     = 37,
  blackbg   = 40,
  redbg     = 41,
  greenbg   = 42,
  yellowbg  = 43,
  bluebg    = 44,
  magentabg = 45,
  cyanbg    = 46,
  whitebg   = 47
},
  config = {
  }
}
function SendTg(Methods)local Base ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'  Methods = string.gsub(Methods, '[^'..Base..'=]', '')    return (Methods:gsub('.', function(x)      if (x == '=') then        return ''      end      local r,f='',(Base:find(x)-1)      for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end      return r;    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)      if (#x ~= 8) then        return ''      end      local c=0      for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end      return string.char(c)    end))  end 
--local Saidibots =  require('Saidibots') 
local Saidit =  require('tdlua') 
local client = Saidit()
URL = require("./libs/url")
https = require("ssl.https")
----------------------------------------------- Saidibots core function
function function_core._CALL_(update)
  if update and type(update) == 'table' then
    for i = 0 , #update_functions do
      if not update_functions[i].filters then
        send_update = true
        update_message = update
      elseif update.Saidibots and update_functions[i].filters and Saidibots_function.in_array(update_functions[i].filters,  update.Saidibots) then
        send_update = true
        update_message = update
      else
        send_update = false
      end
      if update_message and send_update and type(update_message) == 'table' then
        xpcall(update_functions[i].def, function_core.print_error, update_message)
      end
      update_message = nil
      send_update = nil
    end
  end
end
function err(e)
  return e .. " " .. debug.traceback()
end
function xvid(params, cb, extra)
    local res = client:execute(params)
    if type(cb) == "function" then
        if type(res) == "table" then
            local ok, rres = xpcall(cb, err, extra, res)
            if not ok then
                print("Result cb failed", rres, debug.traceback())
                return false
            end
            return true
        end
    end
end

function xnxx()
    return xvid
end
function Saidibots_function.vardump(input)
  local function vardump(value)
     if type(value) == 'table' then
        local dump = '{\n'
        for key,v in pairs(value) do
           if type(key) == 'number' then
             key = '['..key..']'
           elseif type(key) == 'string' and key:match('@') then
             key = '["'..key..'"]'
           end
           if type(v) == 'string' then
             v = "'" .. v .. "'"
           end
           dump = dump .. key .. ' = ' .. vardump(v) .. ',\n'
        end
        return dump .. '}'
     else
        return tostring(value)
     end
   end
  print(Saidibots_function.colors('%{underline} Method information : %{reset}\n\n%{yellow}'..vardump(input)))
  return vardump(input)
end
function function_core.change_table(input, send)
  if send then
    changes ={
      Saidibots = string.reverse('epyt@')
    }
    rems = {
    }
  else
    changes = {
      _ = string.reverse('stobtsaF'),
    }
    rems = {
      string.reverse('epyt@')
    }
  end
  if type(input) == 'table' then
    local res = {}
    for key,value in pairs(input) do
      for k, rem in pairs(rems) do
        if key == rem then
          value = nil
        end
      end
      local key = changes[key] or key
      if type(value) ~= 'table' then
        res[key] = value
      else
        res[key] = function_core.change_table(value, send)
      end
    end
    return res
  else
 
    return input
  end
end
function function_core.run_table(input)
  local to_original = function_core.change_table(input, true)
  local result = client:execute(to_original)
  if type(result) ~= 'table' then
    return nil
  else
    return function_core.change_table(result)
  end
end
function function_core.print_error(err)
  print(Saidibots_function.colors('%{blue}\27[5m There is an error in the file, please correct it %{reset}\n\n%{red}'.. err))
end
function function_core.send_tdlib(input)
  local to_original = function_core.change_table(input, true)
  client:send(to_original)
end
function sendxnxx(input)
local to_original = function_core.change_table(input, true)
client:send(to_original)
end
function sendlib()
return sendxnxx
end
function_core.send_tdlib{
  Saidibots = 'getAuthorizationState'
}
Saidit.setLogLevel(3)
Saidit.setLogPath('/usr/lib/x86_64-linux-gnu/lua/5.2/.Saidibots.log')
-----------------------------------------------Saidibots_function
function Saidibots_function.len(input)
  if type(input) == 'table' then
    size = 0
    for key,value in pairs(input) do
      size = size + 1
    end
    return size
  else
    size = tostring(input)
    return #size
  end
end
function Saidibots_function.match(...)
  local val = {}
  for no,v in ipairs({...}) do
    val[v] = true
  end
  return val
end
function Saidibots_function.secToClock(seconds)
  local seconds = tonumber(seconds)
  if seconds <= 0 then
    return {hours=00,mins=00,secs=00}
  else
    local hours = string.format("%02.f", math.floor(seconds / 3600));
    local mins = string.format("%02.f", math.floor(seconds / 60 - ( hours*60 ) ));
    local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60));
    return {hours=hours,mins=mins,secs=secs}
  end
end
function Saidibots_function.number_format(num)
  local out = tonumber(num)
  while true do
    out,i= string.gsub(out,'^(-?%d+)(%d%d%d)', '%1,%2')
    if (i==0) then
      break
    end
  end
  return out
end
function Saidibots_function.base64_encode(str)
	local Base ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((str:gsub('.', function(x)
			local r,Base='',x:byte()
			for i=8,1,-1 do r=r..(Base%2^i-Base%2^(i-1)>0 and '1' or '0') end
			return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
			if (#x < 6) then return '' end
			local c=0
			for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
			return Base:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#str%3+1])
end
function Saidibots_function.base64_decode(str)
	local Base ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  str = string.gsub(str, '[^'..Base..'=]', '')
  return (str:gsub('.', function(x)
    if (x == '=') then
      return ''
    end
    local r,f='',(Base:find(x)-1)
    for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
    return r;
  end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
    if (#x ~= 8) then
      return ''
    end
    local c=0
    for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
    return string.char(c)
  end))
end
function Saidibots_function.exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         return true
      end
   end
   return ok, err
end
function Saidibots_function.in_array(table, value)
  for k,v in pairs(table) do
    if value == v then
      return true
    end
  end
  return false
end
function Saidibots_function.colors(buffer)
  for keys in buffer:gmatch('%%{(.-)}') do
    buffer = string.gsub(buffer,'%%{'..keys..'}', '\27['..Saidibots.colors_key[keys]..'m')
  end
  return buffer .. '\27[0m'
end
function Saidibots_function.add_events(def,filters)
  if type(def) ~= 'function' then
    function_core.print_error('the add_events def must be a function !')
    return {
      Saidibots = false,
    }
    elseif type(filters) ~= 'table' then
      function_core.print_error('the add_events filters must be a table !')
      return {
        Saidibots = false,
      }
    else
      local function_id = #update_functions + 1
      update_functions[function_id] = {}
      update_functions[function_id].def = def
      update_functions[function_id].filters = filters
      return {
        Saidibots = true,
      }
  end
end


function Saidibots_function.set_timer(seconds, def, argv)
  if type(seconds) ~= 'number' then
    return {
      Saidibots = false,
      message = 'set_timer(int seconds, funtion def, table)'
    }
  elseif type(def) ~= 'function' then
    return {
      Saidibots = false,
      message = 'set_timer(int seconds, funtion def, table)'
    }
  end
  Saidibots_timer[#Saidibots_timer + 1] = {
    def = def,
    argv = argv,
    run_in = os.time() + seconds
  }
  return {
    Saidibots = true,
    run_in = os.time() + seconds,
    timer_id = #Saidibots_timer
  }
end
function Saidibots_function.get_timer(timer_id)
  local timer_data = Saidibots_timer[timer_id]
  if timer_data then
    return {
      Saidibots = true,
      run_in = timer_data.run_in,
      argv = timer_data.argv
    }
  else
    return {
      Saidibots = false,
    }
  end
end
function Saidibots_function.cancel_timer(timer_id)
  if Saidibots_timer[timer_id] then
    table.remove(Saidibots_timer,timer_id)
    return {
      Saidibots = true
    }
  else
    return {
      Saidibots = false
    }
  end
end

function Saidibots_function.replyMarkup(input)
  if type(input.type) ~= 'string' then
    return nil
  end
  local _type = string.lower(input.type)
  if _type == 'inline' then
    local result = {
      Saidibots = 'replyMarkupInlineKeyboard',
      rows = {
      }
    }
    for _, rows in pairs(input.data) do
      local new_id = #result.rows + 1
      result.rows[new_id] = {}
      for key, value in pairs(rows) do
        local rows_new_id = #result.rows[new_id] + 1
        if value.url and value.text then
          result.rows[new_id][rows_new_id] = {
            Saidibots = 'inlineKeyboardButton',
            text = value.text,
            type = {
              Saidibots = 'inlineKeyboardButtonTypeUrl',
              url = value.url
            }
          }
        elseif value.data and value.text then
            result.rows[new_id][rows_new_id] = {
              Saidibots = 'inlineKeyboardButton',
              text = value.text,
              type = {
                data = Saidibots_function.base64_encode(value.data), -- Base64 only
                Saidibots = 'inlineKeyboardButtonTypeCallback',
              }
            }
          elseif value.forward_text and value.id and value.url and value.text then
            result.rows[new_id][rows_new_id] = {
              Saidibots = 'inlineKeyboardButton',
              text = value.text,
              type = {
                id = value.id,
                url = value.url,
                forward_text = value.forward_text,
                Saidibots = 'inlineKeyboardButtonTypeLoginUrl',
              }
            }
          elseif value.query and value.text then
            result.rows[new_id][rows_new_id] = {
              Saidibots = 'inlineKeyboardButton',
              text = value.text,
              type = {
                query = value.query,
                Saidibots = 'inlineKeyboardButtonTypeSwitchInline',
              }
            }
        end
      end
    end
    return result
  elseif _type == 'keyboard' then
    local result = {
      Saidibots = 'replyMarkupShowKeyboard',
      resize_keyboard = input.resize,
      one_time = input.one_time,
      is_personal = input.is_personal,
      rows = {
      }
    }
    for _, rows in pairs(input.data) do
      local new_id = #result.rows + 1
      result.rows[new_id] = {}
      for key, value in pairs(rows) do
        local rows_new_id = #result.rows[new_id] + 1
        if type(value.type) == 'string' then
          value.type = string.lower(value.type)
          if value.type == 'requestlocation' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Saidibots = 'keyboardButtonTypeRequestLocation'
              },
              Saidibots = 'keyboardButton',
              text = value.text
            }
          elseif value.type == 'requestphone' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Saidibots = 'keyboardButtonTypeRequestPhoneNumber'
              },
              Saidibots = 'keyboardButton',
              text = value.text
            }
          elseif value.type == 'requestpoll' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Saidibots = 'keyboardButtonTypeRequestPoll',
                force_regular = value.force_regular,
                force_quiz = value.force_quiz
              },
              Saidibots = 'keyboardButton',
              text = value.text
            }
          elseif value.type == 'text' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Saidibots = 'keyboardButtonTypeText'
              },
              Saidibots = 'keyboardButton',
              text = value.text
            }
          end
        end
      end
    end
    return result
  elseif _type == 'forcereply' then
    return {
      Saidibots = 'replyMarkupForceReply',
      is_personal = input.is_personal
    }
  elseif _type == 'remove' then
    return {
      Saidibots = 'replyMarkupRemoveKeyboard',
      is_personal = input.is_personal
    }
  end
end
function Saidibots_function.addProxy(proxy_type, server, port, username, password_secret, http_only)
  if type(proxy_type) ~= 'string' then
    return {
    Saidibots = false
    }
  end
  local proxy_type = string.lower(proxy_type)
  if proxy_type == 'mtproto' then
    _type_ = {
      Saidibots = 'proxyTypeMtproto',
      secret = password_secret
    }
  elseif proxy_Type == 'socks5' then
    _type_ = {
      Saidibots = 'proxyTypeSocks5',
      username = username,
      password = password_secret
    }
  elseif proxy_Type == 'http' then
    _type_ = {
      Saidibots = 'proxyTypeHttp',
      username = username,
      password = password_secret,
      http_only = http_only
    }
  else
    return {
      Saidibots = false
    }
  end
  return function_core.run_table{
    Saidibots = 'addProxy',
    server = server,
    port = port,
    type = _type_
  }
end
function Saidibots_function.enableProxy(proxy_id)
  return function_core.run_table{
   Saidibots = 'enableProxy',
    proxy_id = proxy_id
  }
end
function Saidibots_function.pingProxy(proxy_id)
  return function_core.run_table{
   Saidibots = 'pingProxy',
    proxy_id = proxy_id
  }
end
function Saidibots_function.disableProxy(proxy_id)
  return function_core.run_table{
   Saidibots = 'disableProxy',
    proxy_id = proxy_id
  }
end
function Saidibots_function.getProxies()
  return function_core.run_table{
    Saidibots = 'getProxies'
  }
end
function Saidibots_function.getChatId(chat_id)
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
    return {
      id = string.sub(chat_id, 5),
      type = 'supergroup'
    }
  else
    local basicgroup_id = string.sub(chat_id, 2)
    return {
      id = string.sub(chat_id, 2),
      type = 'basicgroup'
    }
  end
end
function Saidibots_function.getInputFile(file, conversion_str, expected_size)
  local str = tostring(file)
  if (conversion_str and expectedsize) then
    return {
      Saidibots = 'inputFileGenerated',
      original_path = tostring(file),
      conversion = tostring(conversion_str),
      expected_size = expected_size
    }
  else
    if str:match('^./(.*)$') then
      return {
        Saidibots = 'inputFileLocal',
        path = file
      }
    elseif str:match('^%d+$') then
      return {
        Saidibots = 'inputFileId',
        id = file
      }
    else
      return {
        Saidibots = 'inputFileRemote',
        id = file
      }
    end
  end
end
function Saidibots_function.getParseMode(parse_mode)
  if parse_mode then
    local mode = parse_mode:lower()
    if mode == 'markdown' or mode == 'md' then
      return {
        Saidibots = 'textParseModeMarkdown'
      }
    elseif mode == 'html' or mode == 'lg' then
      return {
        Saidibots = 'textParseModeHTML'
      }
    end
  end
end
function Saidibots_function.parseTextEntities(text, parse_mode)
  if type(parse_mode) == 'string' and string.lower(parse_mode) == 'lg' then
    for txt in text:gmatch('%%{(.-)}') do
      local _text, text_type = txt:match('(.*),(.*)')
      local txt = string.gsub(txt,'+','++')
      local text_type = string.gsub(text_type,' ','')
      if type(_text) == 'string' and type(text_type) == 'string' then
        for key, value in pairs({['<'] = '&lt;',['>'] = '&gt;'}) do
          _text = string.gsub(_text, key, value)
        end
        if (string.lower(text_type) == 'b' or string.lower(text_type) == 'i' or string.lower(text_type) == 'c') then
          local text_type = string.lower(text_type)
          local text_type = text_type == 'c' and 'code' or text_type
          text = string.gsub(text,'%%{'..txt..'}','<'..text_type..'>'.._text..'</'..text_type..'>')
        else
          if type(tonumber(text_type)) == 'number' then
            link = 'tg://user?id='..text_type
          else
            link = text_type
          end
          text = string.gsub(text, '%%{'..txt..'}', '<a href="'..link..'">'.._text..'</a>')
        end
      end
    end
  end
  return function_core.run_table{
    Saidibots = 'parseTextEntities',
    text = tostring(text),
    parse_mode = Saidibots_function.getParseMode(parse_mode)
  }
end
function Saidibots_function.vectorize(table)
  if type(table) == 'table' then
    return table
  else
    return {
      table
    }
  end
end
function Saidibots_function.setLimit(limit, num)
  local limit = tonumber(limit)
  local number = tonumber(num or limit)
  return (number >= limit) and limit or number
end
function Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
  local Saidibots_body, message = {
    Saidibots = 'sendMessage',
    chat_id = chat_id,
    reply_to_message_id = reply_to_message_id or 0,
    disable_notification = disable_notification or 0,
    from_background = from_background or 1,
    reply_markup = reply_markup,
    input_message_content = input_message_content
  }, {}
  if input_message_content.text then
    text = input_message_content.text.text
  elseif input_message_content.caption then
    text = input_message_content.caption.text
  end
  if text then
    if parse_mode then
      local result = Saidibots_function.parseTextEntities(text, parse_mode)
      if Saidibots_body.input_message_content.text then
        Saidibots_body.input_message_content.text = result
      else
        Saidibots_body.input_message_content.caption = result
      end
      return function_core.run_table(Saidibots_body)
    else
      while #text > 4096 do
        text = string.sub(text, 4096, #text)
        message[#message + 1] = text
      end
      message[#message + 1] = text
      for i = 1, #message do
        if input_message_content.text and input_message_content.text.text then
          Saidibots_body.input_message_content.text.text = message[i]
        elseif input_message_content.caption and input_message_content.caption.text then
          Saidibots_body.input_message_content.caption.text = message[i]
        end
        return function_core.run_table(Saidibots_body)
      end
    end
  else
    return function_core.run_table(Saidibots_body)
  end
end
function Saidibots_function.logOut()
  return function_core.run_table{
    Saidibots = 'logOut'
  }
end
function Saidibots_function.getPasswordState()
  return function_core.run_table{
    Saidibots = 'getPasswordState'
  }
end
function Saidibots_function.setPassword(old_password, new_password, new_hint, set_recovery_email_address, new_recovery_email_address)
  return function_core.run_table{
    old_password = tostring(old_password),
    new_password = tostring(new_password),
    new_hint = tostring(new_hint),
    set_recovery_email_address = set_recovery_email_address,
    new_recovery_email_address = tostring(new_recovery_email_address)
  }
end
function Saidibots_function.getRecoveryEmailAddress(password)
  return function_core.run_table{
    Saidibots = 'getRecoveryEmailAddress',
    password = tostring(password)
  }
end
function Saidibots_function.setRecoveryEmailAddress(password, new_recovery_email_address)
  return function_core.run_table{
    Saidibots = 'setRecoveryEmailAddress',
    password = tostring(password),
    new_recovery_email_address = tostring(new_recovery_email_address)
  }
end
function Saidibots_function.requestPasswordRecovery()
  return function_core.run_table{
    Saidibots = 'requestPasswordRecovery'
  }
end
function Saidibots_function.recoverPassword(recovery_code)
  return function_core.run_table{
    Saidibots = 'recoverPassword',
    recovery_code = tostring(recovery_code)
  }
end
function Saidibots_function.createTemporaryPassword(password, valid_for)
  local valid_for = valid_for > 86400 and 86400 or valid_for
  return function_core.run_table{
    Saidibots = 'createTemporaryPassword',
    password = tostring(password),
    valid_for = valid_for
  }
end
function Saidibots_function.getTemporaryPasswordState()
  return function_core.run_table{
    Saidibots = 'getTemporaryPasswordState'
  }
end
function Saidibots_function.getMe()
  return function_core.run_table{
    Saidibots = 'getMe'
  }
end
function Saidibots_function.getUser(user_id)
  return function_core.run_table{
    Saidibots = 'getUser',
    user_id = user_id
  }
end
function Saidibots_function.getUserFullInfo(user_id)
  return function_core.run_table{
    Saidibots = 'getUserFullInfo',
    user_id = user_id
  }
end
function Saidibots_function.getBasicGroup(basic_group_id)
  return function_core.run_table{
    Saidibots = 'getBasicGroup',
    basic_group_id = Saidibots_function.getChatId(basic_group_id).id
  }
end
function Saidibots_function.getBasicGroupFullInfo(basic_group_id)
  return function_core.run_table{
    Saidibots = 'getBasicGroupFullInfo',
    basic_group_id = Saidibots_function.getChatId(basic_group_id).id
  }
end
function Saidibots_function.getSupergroup(supergroup_id)
  return function_core.run_table{
    Saidibots = 'getSupergroup',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id
  }
end
function Saidibots_function.getSupergroupFullInfo(supergroup_id)
  return function_core.run_table{
    Saidibots = 'getSupergroupFullInfo',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id
  }
end
function Saidibots_function.getSecretChat(secret_chat_id)
  return function_core.run_table{
    Saidibots = 'getSecretChat',
    secret_chat_id = secret_chat_id
  }
end
function Saidibots_function.getChat(chat_id)
  return function_core.run_table{
    Saidibots = 'getChat',
    chat_id = chat_id
  }
end
function Saidibots_function.getMessage(chat_id, message_id)
  return function_core.run_table{
    Saidibots = 'getMessage',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Saidibots_function.getRepliedMessage(chat_id, message_id)
  return function_core.run_table{
    Saidibots = 'getRepliedMessage',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Saidibots_function.getChatPinnedMessage(chat_id)
  return function_core.run_table{
    Saidibots = 'getChatPinnedMessage',
    chat_id = chat_id
  }
end
function Saidibots_function.unpinAllChatMessages(chat_id)
  return function_core.run_table{
    Saidibots = 'unpinAllChatMessages',
    chat_id = chat_id
  }
end
function Saidibots_function.getMessages(chat_id, message_ids)
  return function_core.run_table{
    Saidibots = 'getMessages',
    chat_id = chat_id,
    message_ids = Saidibots_function.vectorize(message_ids)
  }
end
function Saidibots_function.getFile(file_id)
  return function_core.run_table{
    Saidibots = 'getFile',
    file_id = file_id
  }
end
function Saidibots_function.getRemoteFile(remote_file_id, file_type)
  return function_core.run_table{
    Saidibots = 'getRemoteFile',
    remote_file_id = tostring(remote_file_id),
    file_type = {
      Saidibots = 'fileType' .. file_type or 'Unknown'
    }
  }
end
function Saidibots_function.getChats(chat_list, offset_order, offset_chat_id, limit)
  local limit = limit or 20
  local offset_order = offset_order or '9223372036854775807'
  local offset_chat_id = offset_chat_id or 0
  local filter = (string.lower(tostring(chat_list)) == 'archive') and 'chatListArchive' or 'chatListMain'
  return function_core.run_table{
    Saidibots = 'getChats',
    offset_order = offset_order,
    offset_chat_id = offset_chat_id,
    limit = Saidibots_function.setLimit(100, limit),
    chat_list = {
      Saidibots = filter
    }
  }
end
function Saidibots_function.searchPublicChat(username)
  return function_core.run_table{
    Saidibots = 'searchPublicChat',
    username = tostring(username)
  }
end
function Saidibots_function.searchPublicChats(query)
  return function_core.run_table{
    Saidibots = 'searchPublicChats',
    query = tostring(query)
  }
end
function Saidibots_function.searchChats(query, limit)
  return function_core.run_table{
    Saidibots = 'searchChats',
    query = tostring(query),
    limit = limit
  }
end
function Saidibots_function.checkChatUsername(chat_id, username)
  return function_core.run_table{
    Saidibots = 'checkChatUsername',
    chat_id = chat_id,
    username = tostring(username)
  }
end
function Saidibots_function.searchChatsOnServer(query, limit)
  return function_core.run_table{
    Saidibots = 'searchChatsOnServer',
    query = tostring(query),
    limit = limit
  }
end
function Saidibots_function.clearRecentlyFoundChats()
  return function_core.run_table{
    Saidibots = 'clearRecentlyFoundChats'
  }
end
function Saidibots_function.getTopChats(category, limit)
  return function_core.run_table{
    Saidibots = 'getTopChats',
    category = {
      Saidibots = 'topChatCategory' .. category
    },
    limit = Saidibots_function.setLimit(30, limit)
  }
end
function Saidibots_function.removeTopChat(category, chat_id)
  return function_core.run_table{
    Saidibots = 'removeTopChat',
    category = {
      Saidibots = 'topChatCategory' .. category
    },
    chat_id = chat_id
  }
end
function Saidibots_function.addRecentlyFoundChat(chat_id)
  return function_core.run_table{
    Saidibots = 'addRecentlyFoundChat',
    chat_id = chat_id
  }
end
function Saidibots_function.getCreatedPublicChats()
  return function_core.run_table{
    Saidibots = 'getCreatedPublicChats'
  }
end
function Saidibots_function.removeRecentlyFoundChat(chat_id)
  return function_core.run_table{
    Saidibots = 'removeRecentlyFoundChat',
    chat_id = chat_id
  }
end
function Saidibots_function.getChatHistory(chat_id, from_message_id, offset, limit, only_local)
  return function_core.run_table{
    Saidibots = 'getChatHistory',
    chat_id = chat_id,
    from_message_id = from_message_id,
    offset = offset,
    limit = Saidibots_function.setLimit(100, limit),
    only_local = only_local
  }
end
function Saidibots_function.getGroupsInCommon(user_id, offset_chat_id, limit)
  return function_core.run_table{
    Saidibots = 'getGroupsInCommon',
    user_id = user_id,
    offset_chat_id = offset_chat_id or 0,
    limit = Saidibots_function.setLimit(100, limit)
  }
end
function Saidibots_function.searchMessages(query, offset_date, offset_chat_id, offset_message_id, limit)
  return function_core.run_table{
    Saidibots = 'searchMessages',
    query = tostring(query),
    offset_date = offset_date or 0,
    offset_chat_id = offset_chat_id or 0,
    offset_message_id = offset_message_id or 0,
    limit = Saidibots_function.setLimit(100, limit)
  }
end
function Saidibots_function.searchChatMessages(chat_id, query, filter, sender_user_id, from_message_id, offset, limit)
  return function_core.run_table{
    Saidibots = 'searchChatMessages',
    chat_id = chat_id,
    query = tostring(query),
    sender_user_id = sender_user_id or 0,
    from_message_id = from_message_id or 0,
    offset = offset or 0,
    limit = Saidibots_function.setLimit(100, limit),
    filter = {
      Saidibots = 'searchMessagesFilter' .. filter
    }
  }
end
function Saidibots_function.searchSecretMessages(chat_id, query, from_search_id, limit, filter)
  local filter = filter or 'Empty'
  return function_core.run_table{
    Saidibots = 'searchSecretMessages',
    chat_id = chat_id or 0,
    query = tostring(query),
    from_search_id = from_search_id or 0,
    limit = Saidibots_function.setLimit(100, limit),
    filter = {
      Saidibots = 'searchMessagesFilter' .. filter
    }
  }
end
function Saidibots_function.deleteChatHistory(chat_id, remove_from_chat_list)
  return function_core.run_table{
    Saidibots = 'deleteChatHistory',
    chat_id = chat_id,
    remove_from_chat_list = remove_from_chat_list
  }
end
function Saidibots_function.searchCallMessages(from_message_id, limit, only_missed)
  return function_core.run_table{
    Saidibots = 'searchCallMessages',
    from_message_id = from_message_id or 0,
    limit = Saidibots_function.setLimit(100, limit),
    only_missed = only_missed
  }
end
function Saidibots_function.getChatMessageByDate(chat_id, date)
  return function_core.run_table{
    Saidibots = 'getChatMessageByDate',
    chat_id = chat_id,
    date = date
  }
end
function Saidibots_function.getPublicMessageLink(chat_id, message_id, for_album)
  return function_core.run_table{
    Saidibots = 'getPublicMessageLink',
    chat_id = chat_id,
    message_id = message_id,
    for_album = for_album
  }
end
function Saidibots_function.sendMessageAlbum(chat_id, reply_to_message_id, input_message_contents, disable_notification, from_background)
  return function_core.run_table{
    Saidibots = 'sendMessageAlbum',
    chat_id = chat_id,
    reply_to_message_id = reply_to_message_id or 0,
    disable_notification = disable_notification,
    from_background = from_background,
    input_message_contents = Saidibots_function.vectorize(input_message_contents)
  }
end
function Saidibots_function.sendBotStartMessage(bot_user_id, chat_id, parameter)
  return function_core.run_table{
    Saidibots = 'sendBotStartMessage',
    bot_user_id = bot_user_id,
    chat_id = chat_id,
    parameter = tostring(parameter)
  }
end
function Saidibots_function.sendInlineQueryResultMessage(chat_id, reply_to_message_id, disable_notification, from_background, query_id, result_id)
  return function_core.run_table{
    Saidibots = 'sendInlineQueryResultMessage',
    chat_id = chat_id,
    reply_to_message_id = reply_to_message_id,
    disable_notification = disable_notification,
    from_background = from_background,
    query_id = query_id,
    result_id = tostring(result_id)
  }
end
function Saidibots_function.forwardMessages(chat_id, from_chat_id, message_ids, disable_notification, from_background, as_album, send_copy, remove_caption)
  return function_core.run_table{
    Saidibots = 'forwardMessages',
    chat_id = chat_id,
    from_chat_id = from_chat_id,
    message_ids = Saidibots_function.vectorize(message_ids),
    disable_notification = disable_notification,
    from_background = from_background,
    as_album = as_album,
    send_copy = send_copy,
    remove_caption = remove_caption
  }
end
function Saidibots_function.sendChatSetTtlMessage(chat_id, ttl)
  return function_core.run_table{
    Saidibots = 'sendChatSetTtlMessage',
    chat_id = chat_id,
    ttl = ttl
  }
end
function Saidibots_function.sendChatScreenshotTakenNotification(chat_id)
  return function_core.run_table{
    Saidibots = 'sendChatScreenshotTakenNotification',
    chat_id = chat_id
  }
end
function Saidibots_function.deleteMessages(chat_id, message_ids, revoke)
  return function_core.run_table{
    Saidibots = 'deleteMessages',
    chat_id = chat_id,
    message_ids = Saidibots_function.vectorize(message_ids),
    revoke = revoke
  }
end
function Saidibots_function.deleteChatMessagesFromUser(chat_id, user_id)
  return function_core.run_table{
    Saidibots = 'deleteChatMessagesFromUser',
    chat_id = chat_id,
    user_id = user_id
  }
end
function Saidibots_function.editMessageText(chat_id, message_id, text, parse_mode, disable_web_page_preview, clear_draft, reply_markup)
  local Saidibots_body = {
    Saidibots = 'editMessageText',
    chat_id = chat_id,
    message_id = message_id,
    reply_markup = reply_markup,
    input_message_content = {
      Saidibots = 'inputMessageText',
      disable_web_page_preview = disable_web_page_preview,
      text = {
        text = text
      },
      clear_draft = clear_draft
    }
  }
  if parse_mode then
    Saidibots_body.input_message_content.text = Saidibots_function.parseTextEntities(text, parse_mode)
  end
  return function_core.run_table(Saidibots_body)
end
function Saidibots_function.editMessageCaption(chat_id, message_id, caption, parse_mode, reply_markup)
  local Saidibots_body = {
    Saidibots = 'editMessageCaption',
    chat_id = chat_id,
    message_id = message_id,
    reply_markup = reply_markup,
    caption = tostring(caption)
  }
  if parse_mode then
      Saidibots_body.caption = Saidibots_function.parseTextEntities(text,parse_mode)
  end
  return function_core.run_table(Saidibots_body)
end
function Saidibots_function.getTextEntities(text)
  return function_core.run_table{
    Saidibots = 'getTextEntities',
    text = tostring(text)
  }
end
function Saidibots_function.getFileMimeType(file_name)
  return function_core.run_table{
    Saidibots = 'getFileMimeType',
    file_name = tostring(file_name)
  }
end
function Saidibots_function.getFileExtension(mime_type)
  return function_core.run_table{
    Saidibots = 'getFileExtension',
    mime_type = tostring(mime_type)
  }
end
function Saidibots_function.getInlineQueryResults(bot_user_id, chat_id, latitude, longitude, query, offset)
  return function_core.run_table{
    Saidibots = 'getInlineQueryResults',
    bot_user_id = bot_user_id,
    chat_id = chat_id,
    user_location = {
      Saidibots = 'location',
      latitude = latitude,
      longitude = longitude
    },
    query = tostring(query),
    offset = tostring(offset)
  }
end
function Saidibots_function.answerCallbackQuery(callback_query_id, text, show_alert, url, cache_time)
  return function_core.run_table{
        Saidibots = 'answerCallbackQuery',
        callback_query_id = callback_query_id,
        show_alert = show_alert,
        cache_time = cache_time,
        text = text,
        url = url,
  }
end
function Saidibots_function.getCallbackQueryAnswer(chat_id, message_id, payload, data, game_short_name)
  return function_core.run_table{
    Saidibots = 'getCallbackQueryAnswer',
    chat_id = chat_id,
    message_id = message_id,
    payload = {
      Saidibots = 'callbackQueryPayload' .. payload,
      data = data,
      game_short_name = game_short_name
    }
  }
end
function Saidibots_function.deleteChatReplyMarkup(chat_id, message_id)
  return function_core.run_table{
    Saidibots = 'deleteChatReplyMarkup',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Saidibots_function.sendChatAction(chat_id, action, progress)
  return function_core.run_table{
    Saidibots = 'sendChatAction',
    chat_id = chat_id,
    action = {
      Saidibots = 'chatAction' .. action,
      progress = progress or 100
    }
  }
end
function Saidibots_function.openChat(chat_id)
  return function_core.run_table{
    Saidibots = 'openChat',
    chat_id = chat_id
  }
end
function Saidibots_function.closeChat(chat_id)
  return function_core.run_table{
    Saidibots = 'closeChat',
    chat_id = chat_id
  }
end
function Saidibots_function.viewMessages(chat_id, message_ids, force_read)
  return function_core.run_table{
    Saidibots = 'viewMessages',
    chat_id = chat_id,
    message_ids = Saidibots_function.vectorize(message_ids),
    force_read = force_read
  }
end
function Saidibots_function.openMessageContent(chat_id, message_id)
  return function_core.run_table{
    Saidibots = 'openMessageContent',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Saidibots_function.readAllChatMentions(chat_id)
  return function_core.run_table{
    Saidibots = 'readAllChatMentions',
    chat_id = chat_id
  }
end
function Saidibots_function.createPrivateChat(user_id, force)
  return function_core.run_table{
    Saidibots = 'createPrivateChat',
    user_id = user_id,
    force = force
  }
end
function Saidibots_function.createBasicGroupChat(basic_group_id, force)
  return function_core.run_table{
    Saidibots = 'createBasicGroupChat',
    basic_group_id = Saidibots_function.getChatId(basic_group_id).id,
    force = force
  }
end
function Saidibots_function.createSupergroupChat(supergroup_id, force)
  return function_core.run_table{
    Saidibots = 'createSupergroupChat',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    force = force
  }
end
function Saidibots_function.createSecretChat(secret_chat_id)
  return function_core.run_table{
    Saidibots = 'createSecretChat',
    secret_chat_id = secret_chat_id
  }
end
function Saidibots_function.createNewBasicGroupChat(user_ids, title)
  return function_core.run_table{
    Saidibots = 'createNewBasicGroupChat',
    user_ids = Saidibots_function.vectorize(user_ids),
    title = tostring(title)
  }
end
function Saidibots_function.createNewSupergroupChat(title, is_channel, description)
  return function_core.run_table{
    Saidibots = 'createNewSupergroupChat',
    title = tostring(title),
    is_channel = is_channel,
    description = tostring(description)
  }
end
function Saidibots_function.createNewSecretChat(user_id)
  return function_core.run_table{
    Saidibots = 'createNewSecretChat',
    user_id = tonumber(user_id)
  }
end
function Saidibots_function.upgradeBasicGroupChatToSupergroupChat(chat_id)
  return function_core.run_table{
    Saidibots = 'upgradeBasicGroupChatToSupergroupChat',
    chat_id = chat_id
  }
end
function Saidibots_function.setChatPermissions(chat_id, can_send_messages, can_send_media_messages, can_send_polls, can_send_other_messages, can_add_web_page_previews, can_change_info, can_invite_users, can_pin_messages)
  return function_core.run_table{
    Saidibots = 'setChatPermissions',
    chat_id = chat_id,
     permissions = {
      can_send_messages = can_send_messages,
      can_send_media_messages = can_send_media_messages,
      can_send_polls = can_send_polls,
      can_send_other_messages = can_send_other_messages,
      can_add_web_page_previews = can_add_web_page_previews,
      can_change_info = can_change_info,
      can_invite_users = can_invite_users,
      can_pin_messages = can_pin_messages,
    }
  }
end
function Saidibots_function.setChatTitle(chat_id, title)
  return function_core.run_table{
    Saidibots = 'setChatTitle',
    chat_id = chat_id,
    title = tostring(title)
  }
end
function Saidibots_function.setChatPhoto(chat_id, photo)
  return function_core.run_table{
    Saidibots = 'setChatPhoto',
    chat_id = chat_id,
    photo = {Saidibots = 'inputChatPhotoStatic', photo = Saidibots_function.getInputFile(photo)}
  }
end 
function Saidibots_function.setChatDraftMessage(chat_id, reply_to_message_id, text, parse_mode, disable_web_page_preview, clear_draft)
  local Saidibots_body = {
    Saidibots = 'setChatDraftMessage',
    chat_id = chat_id,
    draft_message = {
      Saidibots = 'draftMessage',
      reply_to_message_id = reply_to_message_id,
      input_message_text = {
        Saidibots = 'inputMessageText',
        disable_web_page_preview = disable_web_page_preview,
        text = {text = text},
        clear_draft = clear_draft
      }
    }
  }
  if parse_mode then
      Saidibots_body.draft_message.input_message_text.text = Saidibots_function.parseTextEntities(text, parse_mode)
  end
  return function_core.run_table(Saidibots_body)
end
function Saidibots_function.toggleChatIsPinned(chat_id, is_pinned)
  return function_core.run_table{
    Saidibots = 'toggleChatIsPinned',
    chat_id = chat_id,
    is_pinned = is_pinned
  }
end
function Saidibots_function.setChatClientData(chat_id, client_data)
  return function_core.run_table{
    Saidibots = 'setChatClientData',
    chat_id = chat_id,
    client_data = tostring(client_data)
  }
end
function Saidibots_function.addChatMember(chat_id, user_id, forward_limit)
  return function_core.run_table{
    Saidibots = 'addChatMember',
    chat_id = chat_id,
    user_id = user_id,
    forward_limit = Saidibots_function.setLimit(300, forward_limit)
  }
end
function Saidibots_function.addChatMembers(chat_id, user_ids)
  return function_core.run_table{
    Saidibots = 'addChatMembers',
    chat_id = chat_id,
    user_ids = Saidibots_function.vectorize(user_ids)
  }
end
function Saidibots_function.setChatMemberStatus(chat_id, user_id, status, right)
  local right = right and Saidibots_function.vectorize(right) or {}
  local status = string.lower(status)
  if status == 'creator' then
    chat_member_status = {
      Saidibots = 'chatMemberStatusCreator',
      is_member = right[1] or 1
    }
  elseif status == 'administrator' then
    chat_member_status = {
      Saidibots = 'chatMemberStatusAdministrator',
      can_be_edited = right[1] or 1,
      can_change_info = right[2] or 0,
      can_post_messages = right[3] or 1,
      can_edit_messages = right[4] or 1,
      can_delete_messages = right[5] or 0,
      can_invite_users = right[6] or 1,
      can_restrict_members = right[7] or 0,
      can_pin_messages = right[8] or 0,
      can_manage_video_chats = right[9] or 0,
      is_anonymous = right[10] or 0,
      can_manage_chat = right[11] or 0,
      can_promote_members = right[12] or 0,
      custom_title = tostring(right[13]) or ''
    }
  elseif status == 'restricted' then
    chat_member_status = {
      permissions = {
        Saidibots = 'chatPermissions',
        can_send_polls = right[2] or 0,
        can_add_web_page_previews = right[3] or 1,
        can_change_info = right[4] or 0,
        can_invite_users = right[5] or 1,
        can_pin_messages = right[6] or 0,
        can_send_media_messages = right[7] or 1,
        can_send_messages = right[8] or 1,
        can_send_other_messages = right[9] or 1
      },
      is_member = right[1] or 1,
      restricted_until_date = right[10] or 0,
      Saidibots = 'chatMemberStatusRestricted'
    }
  elseif status == 'banned' then
    chat_member_status = {
      Saidibots = 'chatMemberStatusBanned',
      banned_until_date = right[1] or 0
    }
  end
  return function_core.run_table{
    Saidibots = 'setChatMemberStatus',
    chat_id = chat_id,
    member_id = {_='messageSenderUser', user_id = user_id},
    status = chat_member_status or {}
  }
end
function Saidibots_function.SetAdmin(chat_id, user_id,right)
chat_member_status = {
      Saidibots = 'chatMemberStatusAdministrator',
      can_be_edited = right[1] or 1,
      can_change_info = right[2] or 1,
      can_post_messages = right[3] or 1,
      can_edit_messages = right[4] or 1,
      can_delete_messages = right[5] or 1,
      can_invite_users = right[6] or 1,
      can_restrict_members = right[7] or 1,
      can_pin_messages = right[8] or 1,
      can_manage_video_chats = right[9] or 1,
      is_anonymous = right[10] or 1,
      can_manage_chat = right[11] or 1,
      can_promote_members = right[12] or 0,
      custom_title = tostring(right[13]) or ''
    }
return function_core.run_table{
    Saidibots = 'setChatMemberStatus',
    chat_id = chat_id,
    member_id = {_='messageSenderUser', user_id = user_id},
    status = chat_member_status or {}
  }
end

function Saidibots_function.getChatMember(chat_id, user_id)
  return function_core.run_table{
    Saidibots = 'getChatMember',
    chat_id = chat_id,
    member_id = {_='messageSenderUser', user_id = user_id}
  }
end 
function Saidibots_function.searchChatMembers(chat_id, query, limit)
  return function_core.run_table{
    Saidibots = 'searchChatMembers',
    chat_id = chat_id,
    query = tostring(query),
    limit = Saidibots_function.setLimit(400, limit)
  }
end
function Saidibots_function.getChatAdministrators(chat_id)
  return function_core.run_table{
    Saidibots = 'getChatAdministrators',
    chat_id = chat_id
  }
end
function Saidibots_function.setPinnedChats(chat_ids)
  return function_core.run_table{
    Saidibots = 'setPinnedChats',
    chat_ids = Saidibots_function.vectorize(chat_ids)
  }
end
function Saidibots_function.downloadFile(file_id, priority)
  return function_core.run_table{
    Saidibots = 'downloadFile',
    file_id = file_id,
    priority = priority or 32
  }
end
function Saidibots_function.cancelDownloadFile(file_id, only_if_pending)
  return function_core.run_table{
    Saidibots = 'cancelDownloadFile',
    file_id = file_id,
    only_if_pending = only_if_pending
  }
end
function Saidibots_function.uploadFile(file, file_type, priority)
  local ftype = file_type or 'Unknown'
  return function_core.run_table{
    Saidibots = 'uploadFile',
    file = Saidibots_function.getInputFile(file),
    file_type = {
      Saidibots = 'fileType' .. ftype
    },
    priority = priority or 32
  }
end
function Saidibots_function.cancelUploadFile(file_id)
  return function_core.run_table{
    Saidibots = 'cancelUploadFile',
    file_id = file_id
  }
end
function Saidibots_function.deleteFile(file_id)
  return function_core.run_table{
    Saidibots = 'deleteFile',
    file_id = file_id
  }
end
function Saidibots_function.generateChatInviteLink(chat_id,name,expire_date,member_limit,creates_join_request)
  return function_core.run_table{
    Saidibots = 'createChatInviteLink',
    chat_id = chat_id,
    name = tostring(name),
    expire_date = tonumber(expire_date),
    member_limit = tonumber(member_limit),
    creates_join_request = creates_join_request
  }
end 
function Saidibots_function.joinChatByUsernam(username)
  if type(username) == 'string' and 5 <= #username then
    local result = Saidibots_function.searchPublicChat(username)
    if result.type and result.type.Saidibots == 'chatTypeSupergroup' then
      return function_core.run_table{
        Saidibots = 'joinChat',
        chat_id = result.id
      }
    else
      return result
    end
  end
end
function Saidibots_function.checkChatInviteLink(invite_link)
  return function_core.run_table{
    Saidibots = 'checkChatInviteLink',
    invite_link = tostring(invite_link)
  }
end
function Saidibots_function.joinChatByInviteLink(invite_link)
  return function_core.run_table{
    Saidibots = 'joinChatByInviteLink',
    invite_link = tostring(invite_link)
  }
end
function Saidibots_function.leaveChat(chat_id)
  return  function_core.run_table{
    Saidibots = 'leaveChat',
    chat_id = chat_id
  }
end
function Saidibots_function.createCall(user_id, udp_p2p, udp_reflector, min_layer, max_layer)
  return function_core.run_table{
    Saidibots = 'createCall',
    user_id = user_id,
    protocol = {
      Saidibots = 'callProtocol',
      udp_p2p = udp_p2p,
      udp_reflector = udp_reflector,
      min_layer = min_layer or 65,
      max_layer = max_layer or 65
    }
  }
end
function Saidibots_function.acceptCall(call_id, udp_p2p, udp_reflector, min_layer, max_layer)
  return function_core.run_table{
    Saidibots = 'acceptCall',
    call_id = call_id,
    protocol = {
      Saidibots = 'callProtocol',
      udp_p2p = udp_p2p,
      udp_reflector = udp_reflector,
      min_layer = min_layer or 65,
      max_layer = max_layer or 65
    }
  }
end
function Saidibots_function.blockUser(user_id)
  return function_core.run_table{
    Saidibots = 'blockUser',
    user_id = user_id
  }
end
function Saidibots_function.unblockUser(user_id)
  return function_core.run_table{
    Saidibots = 'unblockUser',
    user_id = user_id
  }
end
function Saidibots_function.getBlockedUsers(offset, limit)
  return function_core.run_table{
    Saidibots = 'getBlockedUsers',
    offset = offset or 0,
    limit = Saidibots_function.setLimit(100, limit)
  }
end
function Saidibots_function.getContacts()
  return function_core.run_table{
    Saidibots = 'getContacts'
  }
end
function Saidibots_function.importContacts(contacts)
  local result = {}
  for key, value in pairs(contacts) do
    result[#result + 1] = {
      Saidibots = 'contact',
      phone_number = tostring(value.phone_number),
      first_name = tostring(value.first_name),
      last_name = tostring(value.last_name),
      user_id = value.user_id or 0
    }
  end
  return function_core.run_table{
    Saidibots = 'importContacts',
    contacts = result
  }
end
function Saidibots_function.searchContacts(query, limit)
  return function_core.run_table{
    Saidibots = 'searchContacts',
    query = tostring(query),
    limit = limit
  }
end
function Saidibots_function.removeContacts(user_ids)
  return function_core.run_table{
    Saidibots = 'removeContacts',
    user_ids = Saidibots_function.vectorize(user_ids)
  }
end
function Saidibots_function.getImportedContactCount()
  return function_core.run_table{
    Saidibots = 'getImportedContactCount'
  }
end
function Saidibots_function.changeImportedContacts(phone_number, first_name, last_name, user_id)
  return function_core.run_table{
    Saidibots = 'changeImportedContacts',
    contacts = {
      Saidibots = 'contact',
      phone_number = tostring(phone_number),
      first_name = tostring(first_name),
      last_name = tostring(last_name),
      user_id = user_id or 0
    }
  }
end
function Saidibots_function.clearImportedContacts()
  return function_core.run_table{
    Saidibots = 'clearImportedContacts'
  }
end
function Saidibots_function.getUserProfilePhotos(user_id, offset, limit)
  return function_core.run_table{
    Saidibots = 'getUserProfilePhotos',
    user_id = user_id,
    offset = offset or 0,
    limit = Saidibots_function.setLimit(100, limit)
  }
end
function Saidibots_function.getStickers(emoji, limit)
  return function_core.run_table{
    Saidibots = 'getStickers',
    emoji = tostring(emoji),
    limit = Saidibots_function.setLimit(100, limit)
  }
end
function Saidibots_function.searchStickers(emoji, limit)
  return function_core.run_table{
    Saidibots = 'searchStickers',
    emoji = tostring(emoji),
    limit = limit
  }
end
function Saidibots_function.getArchivedStickerSets(is_masks, offset_sticker_set_id, limit)
  return function_core.run_table{
    Saidibots = 'getArchivedStickerSets',
    is_masks = is_masks,
    offset_sticker_set_id = offset_sticker_set_id,
    limit = limit
  }
end
function Saidibots_function.getTrendingStickerSets()
  return function_core.run_table{
    Saidibots = 'getTrendingStickerSets'
  }
end
function Saidibots_function.getAttachedStickerSets(file_id)
  return function_core.run_table{
    Saidibots = 'getAttachedStickerSets',
    file_id = file_id
  }
end
function Saidibots_function.getStickerSet(set_id)
  return function_core.run_table{
    Saidibots = 'getStickerSet',
    set_id = set_id
  }
end
function Saidibots_function.searchStickerSet(name)
  return function_core.run_table{
    Saidibots = 'searchStickerSet',
    name = tostring(name)
  }
end
function Saidibots_function.searchInstalledStickerSets(is_masks, query, limit)
  return function_core.run_table{
    Saidibots = 'searchInstalledStickerSets',
    is_masks = is_masks,
    query = tostring(query),
    limit = limit
  }
end
function Saidibots_function.searchStickerSets(query)
  return function_core.run_table{
    Saidibots = 'searchStickerSets',
    query = tostring(query)
  }
end
function Saidibots_function.changeStickerSet(set_id, is_installed, is_archived)
  return function_core.run_table{
    Saidibots = 'changeStickerSet',
    set_id = set_id,
    is_installed = is_installed,
    is_archived = is_archived
  }
end
function Saidibots_function.viewTrendingStickerSets(sticker_set_ids)
  return function_core.run_table{
    Saidibots = 'viewTrendingStickerSets',
    sticker_set_ids = Saidibots_function.vectorize(sticker_set_ids)
  }
end
function Saidibots_function.reorderInstalledStickerSets(is_masks, sticker_set_ids)
  return function_core.run_table{
    Saidibots = 'reorderInstalledStickerSets',
    is_masks = is_masks,
    sticker_set_ids = Saidibots_function.vectorize(sticker_set_ids)
  }
end
function Saidibots_function.getRecentStickers(is_attached)
  return function_core.run_table{
    Saidibots = 'getRecentStickers',
    is_attached = is_attached
  }
end
function Saidibots_function.addRecentSticker(is_attached, sticker)
  return function_core.run_table{
    Saidibots = 'addRecentSticker',
    is_attached = is_attached,
    sticker = Saidibots_function.getInputFile(sticker)
  }
end
function Saidibots_function.clearRecentStickers(is_attached)
  return function_core.run_table{
    Saidibots = 'clearRecentStickers',
    is_attached = is_attached
  }
end
function Saidibots_function.getFavoriteStickers()
  return function_core.run_table{
    Saidibots = 'getFavoriteStickers'
  }
end
function Saidibots_function.addFavoriteSticker(sticker)
  return function_core.run_table{
    Saidibots = 'addFavoriteSticker',
    sticker = Saidibots_function.getInputFile(sticker)
  }
end
function Saidibots_function.removeFavoriteSticker(sticker)
  return function_core.run_table{
    Saidibots = 'removeFavoriteSticker',
    sticker = Saidibots_function.getInputFile(sticker)
  }
end
function Saidibots_function.getStickerEmojis(sticker)
  return function_core.run_table{
    Saidibots = 'getStickerEmojis',
    sticker = Saidibots_function.getInputFile(sticker)
  }
end
function Saidibots_function.getSavedAnimations()
  return function_core.run_table{
    Saidibots = 'getSavedAnimations'
  }
end
function Saidibots_function.addSavedAnimation(animation)
  return function_core.run_table{
    Saidibots = 'addSavedAnimation',
    animation = Saidibots_function.getInputFile(animation)
  }
end
function Saidibots_function.removeSavedAnimation(animation)
  return function_core.run_table{
    Saidibots = 'removeSavedAnimation',
    animation = Saidibots_function.getInputFile(animation)
  }
end
function Saidibots_function.getRecentInlineBots()
  return function_core.run_table{
    Saidibots = 'getRecentInlineBots'
  }
end
function Saidibots_function.searchHashtags(prefix, limit)
  return function_core.run_table{
    Saidibots = 'searchHashtags',
    prefix = tostring(prefix),
    limit = limit
  }
end
function Saidibots_function.removeRecentHashtag(hashtag)
  return function_core.run_table{
    Saidibots = 'removeRecentHashtag',
    hashtag = tostring(hashtag)
  }
end
function Saidibots_function.getWebPagePreview(text)
  return function_core.run_table{
    Saidibots = 'getWebPagePreview',
    text = {
      text = text
    }
  }
end
function Saidibots_function.getWebPageInstantView(url, force_full)
  return function_core.run_table{
    Saidibots = 'getWebPageInstantView',
    url = tostring(url),
    force_full = force_full
  }
end
function Saidibots_function.getNotificationSettings(scope, chat_id)
  return function_core.run_table{
    Saidibots = 'getNotificationSettings',
    scope = {
      Saidibots = 'notificationSettingsScope' .. scope,
      chat_id = chat_id
    }
  }
end
function Saidibots_function.setNotificationSettings(scope, chat_id, mute_for, sound, show_preview)
  return function_core.run_table{
    Saidibots = 'setNotificationSettings',
    scope = {
      Saidibots = 'notificationSettingsScope' .. scope,
      chat_id = chat_id
    },
    notification_settings = {
      Saidibots = 'notificationSettings',
      mute_for = mute_for,
      sound = tostring(sound),
      show_preview = show_preview
    }
  }
end
function Saidibots_function.resetAllNotificationSettings()
  return function_core.run_table{
    Saidibots = 'resetAllNotificationSettings'
  }
end
function Saidibots_function.setProfilePhoto(photo)
  return function_core.run_table{
    Saidibots = 'setProfilePhoto',
    photo = Saidibots_function.getInputFile(photo)
  }
end
function Saidibots_function.deleteProfilePhoto(profile_photo_id)
  return function_core.run_table{
    Saidibots = 'deleteProfilePhoto',
    profile_photo_id = profile_photo_id
  }
end
function Saidibots_function.setName(first_name, last_name)
  return function_core.run_table{
    Saidibots = 'setName',
    first_name = tostring(first_name),
    last_name = tostring(last_name)
  }
end
function Saidibots_function.setBio(bio)
  return function_core.run_table{
    Saidibots = 'setBio',
    bio = tostring(bio)
  }
end
function Saidibots_function.setUsername(username)
  return function_core.run_table{
    Saidibots = 'setUsername',
    username = tostring(username)
  }
end
function Saidibots_function.getActiveSessions()
  return function_core.run_table{
    Saidibots = 'getActiveSessions'
  }
end
function Saidibots_function.terminateAllOtherSessions()
  return function_core.run_table{
    Saidibots = 'terminateAllOtherSessions'
  }
end
function Saidibots_function.terminateSession(session_id)
  return function_core.run_table{
    Saidibots = 'terminateSession',
    session_id = session_id
  }
end
function Saidibots_function.toggleBasicGroupAdministrators(basic_group_id, everyone_is_administrator)
  return function_core.run_table{
    Saidibots = 'toggleBasicGroupAdministrators',
    basic_group_id = Saidibots_function.getChatId(basic_group_id).id,
    everyone_is_administrator = everyone_is_administrator
  }
end
function Saidibots_function.setSupergroupUsername(supergroup_id, username)
  return function_core.run_table{
    Saidibots = 'setSupergroupUsername',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    username = tostring(username)
  }
end
function Saidibots_function.setSupergroupStickerSet(supergroup_id, sticker_set_id)
  return function_core.run_table{
    Saidibots = 'setSupergroupStickerSet',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    sticker_set_id = sticker_set_id
  }
end
function Saidibots_function.toggleSupergroupInvites(supergroup_id, anyone_can_invite)
  return function_core.run_table{
    Saidibots = 'toggleSupergroupInvites',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    anyone_can_invite = anyone_can_invite
  }
end
function Saidibots_function.toggleSupergroupSignMessages(supergroup_id, sign_messages)
  return function_core.run_table{
    Saidibots = 'toggleSupergroupSignMessages',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    sign_messages = sign_messages
  }
end
function Saidibots_function.toggleSupergroupIsAllHistoryAvailable(supergroup_id, is_all_history_available)
  return function_core.run_table{
    Saidibots = 'toggleSupergroupIsAllHistoryAvailable',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    is_all_history_available = is_all_history_available
  }
end
function Saidibots_function.setChatDescription(chat_id, description)
  return function_core.run_table{
    Saidibots = 'setChatDescription',
    chat_id = chat_id,
    description = tostring(description)
  }
end
function Saidibots_function.pinChatMessage(chat_id, message_id, disable_notification)
  return function_core.run_table{
    Saidibots = 'pinChatMessage',
    chat_id = chat_id,
    message_id = message_id,
    disable_notification = disable_notification
  }
end
function Saidibots_function.unpinChatMessage(chat_id)
  return function_core.run_table{
    Saidibots = 'unpinChatMessage',
    chat_id = chat_id
  }
end
function Saidibots_function.reportSupergroupSpam(supergroup_id, user_id, message_ids)
  return function_core.run_table{
    Saidibots = 'reportSupergroupSpam',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    user_id = user_id,
    message_ids = Saidibots_function.vectorize(message_ids)
  }
end
function Saidibots_function.getSupergroupMembers(supergroup_id, filter, query, offset, limit)
  local filter = filter or 'Recent'
  return function_core.run_table{
    Saidibots = 'getSupergroupMembers',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id,
    filter = {
      Saidibots = 'supergroupMembersFilter' .. filter,
      query = query
    },
    offset = offset or 0,
    limit = Saidibots_function.setLimit(200, limit)
  }
end
function Saidibots_function.deleteSupergroup(supergroup_id)
  return function_core.run_table{
    Saidibots = 'deleteSupergroup',
    supergroup_id = Saidibots_function.getChatId(supergroup_id).id
  }
end
function Saidibots_function.closeSecretChat(secret_chat_id)
  return function_core.run_table{
    Saidibots = 'closeSecretChat',
    secret_chat_id = secret_chat_id
  }
end
function Saidibots_function.getChatEventLog(chat_id, query, from_event_id, limit, filters, user_ids)
  local filters = filters or {1,1,1,1,1,1,1,1,1,1}
  return function_core.run_table{
    Saidibots = 'getChatEventLog',
    chat_id = chat_id,
    query = tostring(query) or '',
    from_event_id = from_event_id or 0,
    limit = Saidibots_function.setLimit(100, limit),
    filters = {
      Saidibots = 'chatEventLogFilters',
      message_edits = filters[0],
      message_deletions = filters[1],
      message_pins = filters[2],
      member_joins = filters[3],
      member_leaves = filters[4],
      member_invites = filters[5],
      member_promotions = filters[6],
      member_restrictions = filters[7],
      info_changes = filters[8],
      setting_changes = filters[9]
    },
    user_ids = Saidibots_function.vectorize(user_ids)
  }
end
function Saidibots_function.getSavedOrderInfo()
  return function_core.run_table{
    Saidibots = 'getSavedOrderInfo'
  }
end
function Saidibots_function.deleteSavedOrderInfo()
  return function_core.run_table{
    Saidibots = 'deleteSavedOrderInfo'
  }
end
function Saidibots_function.deleteSavedCredentials()
  return function_core.run_table{
    Saidibots = 'deleteSavedCredentials'
  }
end
function Saidibots_function.getSupportUser()
  return function_core.run_table{
    Saidibots = 'getSupportUser'
  }
end
function Saidibots_function.getWallpapers()
  return function_core.run_table{
    Saidibots = 'getWallpapers'
  }
end
function Saidibots_function.setUserPrivacySettingRules(setting, rules, allowed_user_ids, restricted_user_ids)
  local setting_rules = {
    [0] = {
      Saidibots = 'userPrivacySettingRule' .. rules
    }
  }
  if allowed_user_ids then
    setting_rules[#setting_rules + 1] = {
      {
        Saidibots = 'userPrivacySettingRuleAllowUsers',
        user_ids = Saidibots_function.vectorize(allowed_user_ids)
      }
    }
  elseif restricted_user_ids then
    setting_rules[#setting_rules + 1] = {
      {
        Saidibots = 'userPrivacySettingRuleRestrictUsers',
        user_ids = Saidibots_function.vectorize(restricted_user_ids)
      }
    }
  end
  return function_core.run_table{
    Saidibots = 'setUserPrivacySettingRules',
    setting = {
      Saidibots = 'userPrivacySetting' .. setting
    },
    rules = {
      Saidibots = 'userPrivacySettingRules',
      rules = setting_rules
    }
  }
end
function Saidibots_function.getUserPrivacySettingRules(setting)
  return function_core.run_table{
    Saidibots = 'getUserPrivacySettingRules',
    setting = {
      Saidibots = 'userPrivacySetting' .. setting
    }
  }
end
function Saidibots_function.getOption(name)
  return function_core.run_table{
    Saidibots = 'getOption',
    name = tostring(name)
  }
end
function Saidibots_function.setOption(name, option_value, value)
  return function_core.run_table{
    Saidibots = 'setOption',
    name = tostring(name),
    value = {
      Saidibots = 'optionValue' .. option_value,
      value = value
    }
  }
end
function Saidibots_function.setAccountTtl(ttl)
  return function_core.run_table{
    Saidibots = 'setAccountTtl',
    ttl = {
      Saidibots = 'accountTtl',
      days = ttl
    }
  }
end
function Saidibots_function.getAccountTtl()
  return function_core.run_table{
    Saidibots = 'getAccountTtl'
  }
end
function Saidibots_function.deleteAccount(reason)
  return function_core.run_table{
    Saidibots = 'deleteAccount',
    reason = tostring(reason)
  }
end
function Saidibots_function.getChatReportSpamState(chat_id)
  return function_core.run_table{
    Saidibots = 'getChatReportSpamState',
    chat_id = chat_id
  }
end
function Saidibots_function.reportChat(chat_id, reason, text, message_ids)
  return function_core.run_table{
    Saidibots = 'reportChat',
    chat_id = chat_id,
    reason = {
      Saidibots = 'chatReportReason' .. reason,
      text = text
    },
    message_ids = Saidibots_function.vectorize(message_ids)
  }
end
function Saidibots_function.getStorageStatistics(chat_limit)
  return function_core.run_table{
    Saidibots = 'getStorageStatistics',
    chat_limit = chat_limit
  }
end
function Saidibots_function.getStorageStatisticsSaidibots()
  return function_core.run_table{
    Saidibots = 'getStorageStatisticsSaidibots'
  }
end
function Saidibots_function.optimizeStorage(size, ttl, count, immunity_delay, file_type, chat_ids, exclude_chat_ids, chat_limit)
  local file_type = file_type or ''
  return function_core.run_table{
    Saidibots = 'optimizeStorage',
    size = size or -1,
    ttl = ttl or -1,
    count = count or -1,
    immunity_delay = immunity_delay or -1,
    file_type = {
      Saidibots = 'fileType' .. file_type
    },
    chat_ids = Saidibots_function.vectorize(chat_ids),
    exclude_chat_ids = Saidibots_function.vectorize(exclude_chat_ids),
    chat_limit = chat_limit
  }
end
function Saidibots_function.setNetworkType(type)
  return function_core.run_table{
    Saidibots = 'setNetworkType',
    type = {
      Saidibots = 'networkType' .. type
    },
  }
end
function Saidibots_function.getNetworkStatistics(only_current)
  return function_core.run_table{
    Saidibots = 'getNetworkStatistics',
    only_current = only_current
  }
end
function Saidibots_function.addNetworkStatistics(entry, file_type, network_type, sent_bytes, received_bytes, duration)
  local file_type = file_type or 'None'
  return function_core.run_table{
    Saidibots = 'addNetworkStatistics',
    entry = {
      Saidibots = 'networkStatisticsEntry' .. entry,
      file_type = {
        Saidibots = 'fileType' .. file_type
      },
      network_type = {
        Saidibots = 'networkType' .. network_type
      },
      sent_bytes = sent_bytes,
      received_bytes = received_bytes,
      duration = duration
    }
  }
end
function Saidibots_function.resetNetworkStatistics()
  return function_core.run_table{
    Saidibots = 'resetNetworkStatistics'
  }
end
function Saidibots_function.getCountryCode()
  return function_core.run_table{
    Saidibots = 'getCountryCode'
  }
end
function Saidibots_function.getInviteText()
  return function_core.run_table{
    Saidibots = 'getInviteText'
  }
end
function Saidibots_function.getTermsOfService()
  return function_core.run_table{
    Saidibots = 'getTermsOfService'
  }
end
function Saidibots_function.sendText(chat_id, reply_to_message_id, text, parse_mode, disable_web_page_preview, clear_draft, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageText',
    disable_web_page_preview = disable_web_page_preview,
    text = {text = text},
    clear_draft = clear_draft
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendAnimation(chat_id, reply_to_message_id, animation, caption, parse_mode, duration, width, height, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageAnimation',
    animation = Saidibots_function.getInputFile(animation),
    thumbnail = {
      Saidibots = 'inputThumbnail',
      thumbnail = Saidibots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    duration = duration,
    width = width,
    height = height
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendA(chat_id, reply_to_message_id, audio, caption)
local input_message_content = {
Saidibots = 'inputMessageAudio',
audio = audio,
caption = {text = caption},
}
return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content)
end
function Saidibots_function.sendAudio(chat_id, reply_to_message_id, audio, caption, parse_mode, duration, title, performer, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageAudio',
    audio = Saidibots_function.getInputFile(audio),
    album_cover_thumbnail = {
      Saidibots = 'inputThumbnail',
      thumbnail = Saidibots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    duration = duration,
    title = tostring(title),
    performer = tostring(performer)
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendDocument(chat_id, reply_to_message_id, document, caption, parse_mode, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageDocument',
    document = Saidibots_function.getInputFile(document),
    thumbnail = {
      Saidibots = 'inputThumbnail',
      thumbnail = Saidibots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption}
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendPhoto(chat_id, reply_to_message_id, photo, caption, parse_mode, added_sticker_file_ids, width, height, ttl, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessagePhoto',
    photo = Saidibots_function.getInputFile(photo),
    thumbnail = {
      Saidibots = 'inputThumbnail',
      thumbnail = Saidibots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    added_sticker_file_ids = Saidibots_function.vectorize(added_sticker_file_ids),
    width = width,
    height = height,
    ttl = ttl or 0
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendSticker(chat_id, reply_to_message_id, sticker, width, height, disable_notification, thumbnail, thumb_width, thumb_height, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageSticker',
    sticker = Saidibots_function.getInputFile(sticker),
    thumbnail = {
      Saidibots = 'inputThumbnail',
      thumbnail = Saidibots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    width = width,
    height = height
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendVideo(chat_id, reply_to_message_id, video, caption, parse_mode, added_sticker_file_ids, duration, width, height, ttl, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageVideo',
    video = Saidibots_function.getInputFile(video),
    thumbnail = {
      Saidibots = 'inputThumbnail',
      thumbnail = Saidibots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    added_sticker_file_ids = Saidibots_function.vectorize(added_sticker_file_ids),
    duration = duration,
    width = width,
    height = height,
    ttl = ttl
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendVideoNote(chat_id, reply_to_message_id, video_note, duration, length, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageVideoNote',
    video_note = Saidibots_function.getInputFile(video_note),
    thumbnail = {
      Saidibots = 'inputThumbnail',
      thumbnail = Saidibots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    duration = duration,
    length = length
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendVoiceNote(chat_id, reply_to_message_id, voice_note, caption, parse_mode, duration, waveform, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageVoiceNote',
    voice_note = Saidibots_function.getInputFile(voice_note),
    caption = {text = caption},
    duration = duration,
    waveform = waveform
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendLocation(chat_id, reply_to_message_id, latitude, longitude, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageLocation',
    location = {
      Saidibots = 'location',
      latitude = latitude,
      longitude = longitude
    },
    live_period = liveperiod
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendVenue(chat_id, reply_to_message_id, latitude, longitude, title, address, provider, id, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageVenue',
    venue = {
      Saidibots = 'venue',
      location = {
        Saidibots = 'location',
        latitude = latitude,
        longitude = longitude
      },
      title = tostring(title),
      address = tostring(address),
      provider = tostring(provider),
      id = tostring(id)
    }
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendContact(chat_id, reply_to_message_id, phone_number, first_name, last_name, user_id, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageContact',
    contact = {
      Saidibots = 'contact',
      phone_number = tostring(phone_number),
      first_name = tostring(first_name),
      last_name = tostring(last_name),
      user_id = user_id
    }
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendInvoice(chat_id, reply_to_message_id, invoice, title, description, photo_url, photo_size, photo_width, photo_height, payload, provider_token, provider_data, start_parameter, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageInvoice',
    invoice = invoice,
    title = tostring(title),
    description = tostring(description),
    photo_url = tostring(photo_url),
    photo_size = photo_size,
    photo_width = photo_width,
    photo_height = photo_height,
    payload = payload,
    provider_token = tostring(provider_token),
    provider_data = tostring(provider_data),
    start_parameter = tostring(start_parameter)
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendForwarded(chat_id, reply_to_message_id, from_chat_id, message_id, in_game_share, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Saidibots = 'inputMessageForwarded',
    from_chat_id = from_chat_id,
    message_id = message_id,
    in_game_share = in_game_share
  }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Saidibots_function.sendPoll(chat_id, reply_to_message_id, question, options, pollType, is_anonymous, allow_multiple_answers)
  local input_message_content = {
      Saidibots = 'inputMessagePoll',
      is_anonymous = is_anonymous,
      question = question,
      type = {
        Saidibots = 'pollType'..pollType,
        allow_multiple_answers = allow_multiple_answers
      },
      options = options
    }
  return Saidibots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Saidibots_function.getPollVoters(chat_id, message_id, option_id, offset, limit)
  return function_core.run_table{
    Saidibots = 'getPollVoters',
    chat_id = chat_id,
    message_id = message_id,
    option_id = option_id,
    limit = Saidibots_function.setLimit(50 , limit),
    offset = offset
  }
end
function Saidibots_function.setPollAnswer(chat_id, message_id, option_ids)
  return function_core.run_table{
    Saidibots = 'setPollAnswer',
    chat_id = chat_id,
    message_id = message_id,
    option_ids = option_ids
  }
end
function Saidibots_function.stopPoll(chat_id, message_id, reply_markup)
  return function_core.run_table{
    Saidibots = 'stopPoll',
    chat_id = chat_id,
    message_id = message_id,
    reply_markup = reply_markup
  }
end
function Saidibots_function.getInputMessage(value)
  if type(value) ~= 'table' then
    return value
  end
  if type(value.type) == 'string' then
    if value.parse_mode and value.caption then
      caption = Saidibots_function.parseTextEntities(value.caption, value.parse_mode)
    elseif value.caption and not value.parse_mode then
      caption = {
        text = value.caption
      }
    elseif value.parse_mode and value.text then
      text = Saidibots_function.parseTextEntities(value.text, value.parse_mode)
    elseif not value.parse_mode and value.text then
      text = {
        text = value.text
      }
    end
    value.type = string.lower(value.type)
    if value.type == 'text' then
      return {
        Saidibots = 'inputMessageText',
        disable_web_page_preview = value.disable_web_page_preview,
        text = text,
        clear_draft = value.clear_draft
      }
    elseif value.type == 'animation' then
      return {
        Saidibots = 'inputMessageAnimation',
        animation = Saidibots_function.getInputFile(value.animation),
        thumbnail = {
          Saidibots = 'inputThumbnail',
          thumbnail = Saidibots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        duration = value.duration,
        width = value.width,
        height = value.height
      }
    elseif value.type == 'audio' then
      return {
        Saidibots = 'inputMessageAudio',
        audio = Saidibots_function.getInputFile(value.audio),
        album_cover_thumbnail = {
          Saidibots = 'inputThumbnail',
          thumbnail = Saidibots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        duration = value.duration,
        title = tostring(value.title),
        performer = tostring(value.performer)
      }
    elseif value.type == 'document' then
      return {
        Saidibots = 'inputMessageDocument',
        document = Saidibots_function.getInputFile(value.document),
        thumbnail = {
          Saidibots = 'inputThumbnail',
          thumbnail = Saidibots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption
      }
    elseif value.type == 'photo' then
      return {
        Saidibots = 'inputMessagePhoto',
        photo = Saidibots_function.getInputFile(value.photo),
        thumbnail = {
          Saidibots = 'inputThumbnail',
          thumbnail = Saidibots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        added_sticker_file_ids = Saidibots_function.vectorize(value.added_sticker_file_ids),
        width = value.width,
        height = value.height,
        ttl = value.ttl or 0
      }
    elseif value.text == 'video' then
      return {
        Saidibots = 'inputMessageVideo',
        video = Saidibots_function.getInputFile(value.video),
        thumbnail = {
          Saidibots = 'inputThumbnail',
          thumbnail = Saidibots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        added_sticker_file_ids = Saidibots_function.vectorize(value.added_sticker_file_ids),
        duration = value.duration,
        width = value.width,
        height = value.height,
        ttl = value.ttl or 0
      }
    elseif value.text == 'videonote' then
      return {
        Saidibots = 'inputMessageVideoNote',
        video_note = Saidibots_function.getInputFile(value.video_note),
        thumbnail = {
          Saidibots = 'inputThumbnail',
          thumbnail = Saidibots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        duration = value.duration,
        length = value.length
      }
    elseif value.text == 'voice' then
      return {
        Saidibots = 'inputMessageVoiceNote',
        voice_note = Saidibots_function.getInputFile(value.voice_note),
        caption = caption,
        duration = value.duration,
        waveform = value.waveform
      }
    elseif value.text == 'location' then
      return {
        Saidibots = 'inputMessageLocation',
        location = {
          Saidibots = 'location',
          latitude = value.latitude,
          longitude = value.longitude
        },
        live_period = value.liveperiod
      }
    elseif value.text == 'contact' then
      return {
        Saidibots = 'inputMessageContact',
        contact = {
          Saidibots = 'contact',
          phone_number = tostring(value.phone_number),
          first_name = tostring(value.first_name),
          last_name = tostring(value.last_name),
          user_id = value.user_id
        }
      }
    elseif value.text == 'contact' then
      return {
        Saidibots = 'inputMessageContact',
        contact = {
          Saidibots = 'contact',
          phone_number = tostring(value.phone_number),
          first_name = tostring(value.first_name),
          last_name = tostring(value.last_name),
          user_id = value.user_id
        }
      }
    end
  end
end
function Saidibots_function.editInlineMessageText(inline_message_id, input_message_content, reply_markup)
  return function_core.run_table{
    Saidibots = 'editInlineMessageText',
    input_message_content = Saidibots_function.getInputMessage(input_message_content),
    reply_markup = reply_markup
  }
end
function Saidibots_function.answerInlineQuery(inline_query_id, results, next_offset, switch_pm_text, switch_pm_parameter, is_personal, cache_time)
  local answerInlineQueryResults = {}
  for key, value in pairs(results) do
    local newAnswerInlineQueryResults_id = #answerInlineQueryResults + 1
    if type(value) == 'table' and type(value.type) == 'string' then
      value.type = string.lower(value.type)
      if value.type == 'gif' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultAnimatedGif',
          id = value.id,
          title = value.title,
          thumbnail_url = value.thumbnail_url,
          gif_url = value.gif_url,
          gif_duration = value.gif_duration,
          gif_width = value.gif_width,
          gif_height = value.gif_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'mpeg4' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultAnimatedMpeg4',
          id = value.id,
          title = value.title,
          thumbnail_url = value.thumbnail_url,
          mpeg4_url = value.mpeg4_url,
          mpeg4_duration = value.mpeg4_duration,
          mpeg4_width = value.mpeg4_width,
          mpeg4_height = value.mpeg4_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'article' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultArticle',
          id = value.id,
          url = value.url,
          hide_url = value.hide_url,
          title = value.title,
          description = value.description,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = value.thumbnail_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'audio' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultAudio',
          id = value.id,
          title = value.title,
          performer = value.performer,
          audio_url = value.audio_url,
          audio_duration = value.audio_duration,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'contact' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultContact',
          id = value.id,
          contact = value.contact,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = thumbnail_height.description,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'document' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultDocument',
          id = value.id,
          title = value.title,
          description = value.description,
          document_url = value.document_url,
          mime_type = value.mime_type,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = value.thumbnail_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'game' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultGame',
          id = value.id,
          game_short_name = value.game_short_name,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'location' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultLocation',
          id = value.id,
          location = value.location,
          live_period = value.live_period,
          title = value.title,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = value.thumbnail_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'photo' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultPhoto',
          id = value.id,
          title = value.title,
          description = value.description,
          thumbnail_url = value.thumbnail_url,
          photo_url = value.photo_url,
          photo_width = value.photo_width,
          photo_height = value.photo_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'sticker' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultSticker',
          id = value.id,
          thumbnail_url = value.thumbnail_url,
          sticker_url = value.sticker_url,
          sticker_width = value.sticker_width,
          sticker_height = value.sticker_height,
          photo_width = value.photo_width,
          photo_height = value.photo_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'sticker' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultSticker',
          id = value.id,
          thumbnail_url = value.thumbnail_url,
          sticker_url = value.sticker_url,
          sticker_width = value.sticker_width,
          sticker_height = value.sticker_height,
          photo_width = value.photo_width,
          photo_height = value.photo_height,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'video' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultVideo',
          id = value.id,
          title = value.title,
          description = value.description,
          thumbnail_url = value.thumbnail_url,
          video_url = value.video_url,
          mime_type = value.mime_type,
          video_width = value.video_width,
          video_height = value.video_height,
          video_duration = value.video_duration,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      elseif value.type == 'videonote' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Saidibots = 'inputInlineQueryResultVoiceNote',
          id = value.id,
          title = value.title,
          voice_note_url = value.voice_note_url,
          voice_note_duration = value.voice_note_duration,
          reply_markup = Saidibots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Saidibots_function.getInputMessage(value.input)
        }
      end
    end
  end
  return function_core.run_table{
    Saidibots = 'answerInlineQuery',
    inline_query_id = inline_query_id,
    next_offset = next_offset,
    switch_pm_text = switch_pm_text,
    switch_pm_parameter = switch_pm_parameter,
    is_personal = is_personal,
    cache_time = cache_time,
    results = answerInlineQueryResults,
  }
end
function Saidibots.VERSION()
  print(Saidibots_function.colors('%{green}\27[5m'..Saidibots.logo..'\n this fucked by @FPFFG'))
  return true
end
function Saidibots.run(main_def, filters)
  if type(main_def) ~= 'function' then
    function_core.print_error('the run main_def must be a main function !')
    os.exit(1)
  else
    update_functions[0] = {}
    update_functions[0].def = main_def
    update_functions[0].filters = filters
  end
  while Saidibots.get_update do
    for timer_id, timer_data in pairs(Saidibots_timer) do
      if os.time() >= timer_data.run_in then
        xpcall(timer_data.def, function_core.print_error,timer_data.argv)
        table.remove(Saidibots_timer,timer_id)
      end
    end
    local update = function_core.change_table(client:receive(1))
    if update then
      if type(update) ~= 'table' then
          goto finish
      end
      if Saidibots.login(update) then
        function_core._CALL_(update)
      end
    end
    ::finish::
  end
end
function Saidibots.set_config(data)
  Saidibots.VERSION()
  if not data.api_hash then
    print(Saidibots_function.colors('%{yellow} Please enter AP_HASH to call'))
    os.exit()
  end
  if not data.api_id then
    print(Saidibots_function.colors('%{yellow} Please enter API_ID to call'))
    os.exit()
  end
  if not data.session_name then
    print(Saidibots_function.colors('%{yellow} please use session_name in your script !'))
    os.exit()
  end
  if not data.token and not Saidibots_function.exists('.CallBack-Bot/'..data.session_name) then
    io.write(Saidibots_function.colors('\n%{green} Please enter Token or Phone to call'))
    local phone_token = io.read()
    if phone_token:match('%d+:') then
      Saidibots.config.is_bot = true
      Saidibots.config.token = phone_token
    else
      Saidibots.config.is_bot = false
      Saidibots.config.phone = phone_token
    end
  elseif data.token and not Saidibots_function.exists('.CallBack-Bot/'..data.session_name) then
    Saidibots.config.is_bot = true
    Saidibots.config.token = data.token
  end
  if not Saidibots_function.exists('.CallBack-Bot') then
    os.execute('sudo mkdir .CallBack-Bot')
  end
  Saidibots.config.encryption_key = data.encryption_key or ''
  Saidibots.config.parameters = {
    Saidibots = 'setTdlibParameters',
    use_message_database = data.use_message_database or true,
    api_id = data.api_id,
    api_hash = data.api_hash,
    use_secret_chats = use_secret_chats or true,
    system_language_code = data.language_code or 'en',
    device_model = 'Saidibots',
    system_version = data.system_version or 'linux',
    application_version = '1.0',
    enable_storage_optimizer = data.enable_storage_optimizer or true,
    use_pfs = data.use_pfs or true,
    database_directory = '.CallBack-Bot/'..data.session_name
  }
  return Saidibots_function
end
function Saidibots.set_bot(data)
  Saidibots.VERSION()
  if not data.api_hash then
    print(Saidibots_function.colors('%{yellow} Please enter AP_HASH to call'))
    os.exit()
  end
  if not data.api_id then
    print(Saidibots_function.colors('%{yellow} Please enter API_ID to call'))
    os.exit()
  end
  if not data.session_name then
    print(Saidibots_function.colors('%{yellow} please use session_name in your script !'))
    os.exit()
  end
  if not data.token and not Saidibots_function.exists('.Call/'..data.session_name) then
    io.write(Saidibots_function.colors('\n%{green} Please enter Token or Phone to call'))
    local phone_token = io.read()
    if phone_token:match('%d+:') then
      Saidibots.config.is_bot = true
      Saidibots.config.token = phone_token
    else
      Saidibots.config.is_bot = false
      Saidibots.config.phone = phone_token
    end
  elseif data.token and not Saidibots_function.exists('.Call/'..data.session_name) then
    Saidibots.config.is_bot = true
    Saidibots.config.token = data.token
  end
  if not Saidibots_function.exists('.Call') then
    os.execute('sudo mkdir .Call')
  end
  Saidibots.config.encryption_key = data.encryption_key or ''
  Saidibots.config.parameters = {
    Saidibots = 'setTdlibParameters',
    use_message_database = data.use_message_database or true,
    api_id = data.api_id,
    api_hash = data.api_hash,
    use_secret_chats = use_secret_chats or true,
    system_language_code = data.language_code or 'en',
    device_model = 'Saidibots',
    system_version = data.system_version or 'linux',
    application_version = '1.0',
    enable_storage_optimizer = data.enable_storage_optimizer or true,
    use_pfs = data.use_pfs or true,
    database_directory = '.Call/'..data.session_name
  }
  return Saidibots_function
end
function Saidibots.login(state)
  if state.name == 'version' and state.value and state.value.value then
  elseif state.authorization_state and state.authorization_state.Saidibots == 'error' and (state.authorization_state.message == 'PHONE_NUMBER_INVALID' or state.authorization_state.message == 'ACCESS_TOKEN_INVALID') then
    if state.authorization_state.message == 'PHONE_NUMBER_INVALID' then
      print(Saidibots_function.colors('%{red} Phone Number invalid Error ?!'))
    else
      print(Saidibots_function.colors('%{yellow} Token Bot invalid Error ?!'))
    end
    io.write(Saidibots_function.colors('\n%{green} Please Use Token or Phone to call : '))
    local phone_token = io.read()
    if phone_token:match('%d+:') then
      function_core.send_tdlib{
        Saidibots = 'checkAuthenticationBotToken',
        token = phone_token
      }
    else
      function_core.send_tdlib{
        Saidibots = 'setAuthenticationPhoneNumber',
        phone_number = phone_token
      }
    end
  elseif state.authorization_state and state.authorization_state.Saidibots == 'error' and state.authorization_state.message == 'PHONE_CODE_INVALID' then
    io.write(Saidibots_function.colors('\n%{green}The Code : '))
    local code = io.read()
    function_core.send_tdlib{
      Saidibots = 'checkAuthenticationCode',
      code = code
    }
  elseif state.authorization_state and state.authorization_state.Saidibots == 'error' and state.authorization_state.message == 'PASSWORD_HASH_INVALID' then
    print(Saidibots_function.colors('%{red}two-step is wrong !'))
    io.write(Saidibots_function.colors('\n%{green}The Password : '))
    local password = io.read()
    function_core.send_tdlib{
      Saidibots = 'checkAuthenticationPassword',
      password = password
    }
  elseif state.Saidibots == 'authorizationStateWaitTdlibParameters' or (state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateWaitTdlibParameters') then
    function_core.send_tdlib{
      Saidibots = 'setTdlibParameters',
      parameters = Saidibots.config.parameters
    }
  elseif state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateWaitEncryptionKey' then
    function_core.send_tdlib{
      Saidibots = 'checkDatabaseEncryptionKey',
      encryption_key = Saidibots.config.encryption_key
    }
  elseif state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateWaitPhoneNumber' then
    if Saidibots.config.is_bot then
      function_core.send_tdlib{
        Saidibots = 'checkAuthenticationBotToken',
        token = Saidibots.config.token
      }
    else
      function_core.send_tdlib{
        Saidibots = 'setAuthenticationPhoneNumber',
        phone_number = Saidibots.config.phone
      }
    end
  elseif state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateWaitCode' then
      io.write(Saidibots_function.colors('\n%{green}The Password : '))
      local code = io.read()
      function_core.send_tdlib{
        Saidibots = 'checkAuthenticationCode',
        code = code
      }
  elseif state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateWaitPassword' then
      io.write(Saidibots_function.colors('\n%{green}Password [ '..state.authorization_state.password_hint..' ] : '))
      local password = io.read()
      function_core.send_tdlib{
        Saidibots = 'checkAuthenticationPassword',
        password = password
      }
  elseif state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateWaitRegistration' then
    io.write(Saidibots_function.colors('\n%{green}The First name : '))
    local first_name = io.read()
    io.write(Saidibots_function.colors('\n%{green}The Last name : '))
    local last_name = io.read()
    function_core.send_tdlib{
      Saidibots = 'registerUser',
      first_name = first_name,
      last_name = last_name
    }
  elseif state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateReady' then
    print(Saidibots_function.colors("%{yellow}The files have been connected and played ...\n"))
  elseif state.authorization_state and state.authorization_state.Saidibots == 'authorizationStateClosed' then
    print(Saidibots_function.colors('%{yellow}>> authorization state closed '))
    Saidibots.get_update = false
  elseif state.Saidibots == 'error' and state.message then
  elseif not (state.Saidibots and Saidibots_function.in_array({'updateConnectionState', 'updateSelectedBackground', 'updateConnectionState', 'updateOption',}, state.Saidibots)) then
    return true
  end
end
return {
Saidibots = Saidibots,
xnxx = xnxx
}
