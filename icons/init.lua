--      ██╗ ██████╗ ██████╗ ███╗   ██╗███████╗
--      ██║██╔════╝██╔═══██╗████╗  ██║██╔════╝
--      ██║██║     ██║   ██║██╔██╗ ██║███████╗
--      ██║██║     ██║   ██║██║╚██╗██║╚════██║
--      ██║╚██████╗╚██████╔╝██║ ╚████║███████║
--      ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


-- define icon folder directory
local dir = os.getenv('HOME') .. '/.config/awesome/icons/'

-- return icons
return {
  logout = dir .. 'logout.png',
  sleep = dir .. 'sleep.png',
  power = dir .. 'power.png',
  lock = dir .. 'lock.png',
  brightness = dir .. 'brightness.png',
  volume = dir .. 'volume.png',
  volumeoff = dir .. 'volumeoff.png',--add 
  close = dir .. 'close.svg',
  open = dir .. 'open.svg',
  restart = dir .. 'restart.png',
  mem = dir .. 'mem.png',
  cpu = dir .. 'cpu.png',
  temp = dir .. 'temp.png',
  hdd = dir .. 'fs.png',
  note = dir .. "notes.svg"

}
