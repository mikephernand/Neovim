-- custom/dashboard.lua

return {
	"nvimdev/dashboard-nvim",

	config = function()
		-- Import the dashboard module
		local db = require("dashboard")

		-- Define multiple ASCII art headers
		local headers = {
			-- {
			-- 	"⠀⠀⠀⠀⠀⠀⠀                                                                                                                              ",
			-- 	"      :%                :@@@@@@@@@@@@@@@@@@@@+                                 %@*    .:@%.              *@#                                       #@@@@@@@@@@@@@%                 #:       ",
			-- 	"      :%                 =@@@@@@@@@@@@@@@@@@@@:                               :%@%*-     *@%=         -#@@:                                      -@@@@@@@@@@@@@@@*                 #:       ",
			-- 	"      :%           .:=***++@@@@@@@@@@@@@@@@@@@@*.                                 =#%@@@@%%%@@@@@@@@@@%=                                       :@@@@@@@@@@@@@@@@@                  *:       ",
			-- 	"      :%         ==*-.    :*@@@@@@@@@@@@@@@@@@@@@@%+                                    ..:::::::..                                           %@@@@@@@@@@@@@@@@@:=-::.             *:       ",
			-- 	"      :#         **        -*@@@@@@@@@@@@@@@@@@@@@@@@@@@@%+:.                                                                             .=%@@@@@@@@@@@@@@@@@@@+.   -%.           *:       ",
			-- 	"      :#         *+-+.     =* =@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*=:..                                                         :=+%%@@@@@@@@@@@@@@@@@@@@@@@@@:      .*           *:       ",
			-- 	"      :*         -*==*:    =*   .=%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%####*++++===--:::---:--====+*####%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*.    =+: =           *:       ",
			-- 	"      :*         :#==.+-   .*         ++*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*.=.       :+=           *:       ",
			-- 	"      :*         :#=* =#-   *.        *     .:=*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*=::.  ::        :*=           *:       ",
			-- 	"      :*         -**: +#+=  --        *           .=*==%*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#*=:.     .#      *.        :+=           *:       ",
			-- 	"      :*         :**. **#== .#       .*               .+*:#*.     .:=*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*+@=.                :+      +         :+-           *:       ",
			-- 	"      :*         .+#. =*# +: +.      .=                   =*::+*:.                      :.    ..::---==--::::::..      .-=-.=#%-:.             :   :=     =:         :*-           *:       ",
			-- 	"      :*          **..*#= .*.:=      :=  ==::             ...:#=..=+:.                  +         :                .-+- :++:# *    :  .      :::.  :-     *..        :+-           *:       ",
			-- 	"      :*          +#. =*.  .%.*      =:  =:.:=.      .:*=.    ..:=*=..:=*=:.           +.         :=           .=*-..**:.  .*.+        :=.     -:  :-    :---=       :=+           *:       ",
			-- 	"      :*          =*: :-   -%*=:     +:  -=:      :**.               +#=:   .-+=::   .=.           =.     .-**- .=%*.      .*.+          :=.       :-    *:===:.    :++            *:       ",
			-- 	"      :*          .+-.    .%.--*.    *.  .:.   .*#.                   :#=*#%:     .**::             =:+%*: ..*@-.*:         =. ...::----.  --      ::   .===+=-.    *=             *:       ",
			-- 	"      :*           +* .   += .** .   *. ..    ..    .....               =+%*=+*#=-=-.              :**%=+%#-*: :-   .-+#%@@@@@@@@@@@@@@@@@@@@#     -:   +*=+=--=.  =+.             *:       ",
			-- 	"      -*           -*- ..:%  =*:=  .:*.      .#@@%%##%#@@@@@@@@@@%*=:..  ::-=---=.                    =#*:=:  +:.=%@@%##+:% =%=:@.*:     :@+%-     =:   **=+=--=. -+-              *:       ",
			-- 	"      -*            ++ . == .%..*   *#.       :#%*     :@@@@@@@@@@@-=%@@%+   .:::*                  :=+=:+   .:%@@=.   :#-@@*-#@@.@.    .%=#.      =:  .:.*+=:=  .+=               *:       ",
			-- 	"      -*            +*:..== :%  -: .=*. .      =@@#.   . #@@@@@@@@:    .=@=-: .==:                 .=-==%    ::%=       :%=    .=%.    :%#=        +:  *  **=:=. *+                *:       ",
			-- 	"      -*            .*+  :+  -=  *  ++          .*@@=.                 .*... .* +.                 =+*:+.    ..:+.                   .*@-          +. :.  **.=  ++:                *:       ",
			-- 	"      -*             =*: .*.  := =. *:            .+@@%*-.         .=*=+#=--==*:                   +=-=+:   :-==*%@@#=::..    ..::=*%*:            * .*  +-:-: :+=                 *:       ",
			-- 	"      -+              =#- .+.  .*:= *:               :*=******+=-=++#=+=+-*=:                     .=.+-:-*:  :*-+**%%%%%%%@@%##*=-*+.             .# :: *.*:.  **                  *:       ",
			-- 	"      -+               ++=. --. -%*.+.                =+===+=-===-:.-=+*=:                         = =-:#--     .:=-=+=:::==*=#:                  .* *.%#=*.  **:                  *:       ",
			-- 	"      -=                ++=.  =%# .==.                     ...                                     ===.:==.::         .=.   : =                   .#.=:      -=:                   *:       ",
			-- 	"      -=                 *==:      *-:                          ::                     .-#@@@@@@%*:.*-.-*..:*.  ==         := :                   .**       .+-                    *:       ",
			-- 	"      -=                 .*=       :-:        .=.             .      .            .*@@@@@@@@@@@@@@@@#=.==::=:              .=.*                   :**       *+                     *:       ",
			-- 	"      -=                  .*-       :=      :=..=. .=+.:          ::.           :%@@@@@@@@@@@@@@@@@@@@@*+..:               .=.*     .             :*:      +*                      *:       ",
			-- 	"      -=                   :*-      :*     ..=-.:=-.==. .          .          :@@@@@@@@@@@@@@@@@@@@@@@@@@*.                .=.*  .-=.:=..+=       =%      ==.                      *:       ",
			-- 	"      ==                    :+:      *:   .-:.-= :=::*+.=-                 .+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+:             :=.+ =-:+:. -: :       -:     -=:                       *:       ",
			-- 	"      ==                     *+      ++     :. -=              .:.       :%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%=.         -=.+ -=  .=:.=-              =+.                        *:       ",
			-- 	"      ==                     .+==::-+=*:                             .+%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*:      =:.+  :=:   ..:       ::    =+.                         *:       ",
			-- 	"      ==                ....=%*#     .+=                         .:#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%=.  +:.-     :=.=.       .**%@@**                           *:       ",
			-- 	"      ==          =*+=++=-:::=+#      **.                    .-#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%=::    .            -.  .*:                            *:       ",
			-- 	"      ==    .-**==-..-==-.  ..:*      :=:               .:*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#=.             :+   .*                             *:       ",
			-- 	"      ==.#*#+:: -*-.  .=*=:   .*       +*.        .-*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*:        .#.   .+.                            *:       ",
			-- 	"      =@+:   -:   -==.        .+       .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=    :=-===*+-=:                    *:       ",
			-- 	"      ==    *=  :+.           .=   #-   *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#     =:::..   .:+*==+**-..          *:       ",
			-- 	"      == :%-.  +:             :: :=-=   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:     *    .:-+**:. ..=+::=*=+=      *:       ",
			-- 	"      =@-*.  .=           :==:=:=:  *    *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*     .#            :==:      .:+==   *:       ",
			-- 	"      =-+.  :=           .++. =* .::*.   :@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:  -*.:=*#*:.          .*.  -     .+: *:       ",
			-- 	"      ===   =          :+. :=+=::====.  .#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=  :***-======-*         :=  .*     .*-*:       ",
			-- 	"      =*:   #:         =#=..=*=.:+*==: .+:#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+  .#==*+:-=+*+-=-         =   ::     -**:       ",
			-- 	"",
			-- },
			{
				"⠀⠀⠀⠀⠀⠀⠀⠀⢰⣦⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⣀⣀⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀",
				"⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀",
				"⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀",
				"⠀⠀⠉⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⠋⠈⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠉⠻⠟⠁⠀⠀⠸⣿⣿⣿⣿⣿⣿⣧⠀⠀",
				"⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⠀⠀",
				"⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡀⠀",
				"⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⠈⣿⣿⣿⡇⠀",
				"⠀⠀ ⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠑⠻⢤⣀⡀⠀⠀⠀⠀  ⠀⢀⡤⠞⠋⠀⠀⣿⣿⣿⣿⡇⠀",
				"⠀⠀⠐⠛⠋⠉⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁ ⢶⣶⣶⣶⣮⡍⠉⠁⠀⠀⠀⠥⢴⣶⣶⣶⣦ ⣿⣿⣿⣿⣿⠀",
				"⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⡿⢻⣿⣿⣿⣿⣿⣿⣿⣷ ⠀⠻⢿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠹⣿⡿⠋⢸⣿⣿⣿⣿⡀",
				"⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⡇⠀⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⣿⡇",
				"⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣇⠀⠸⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠁⠙⠿",
				"⠀⠀⠀⠀⠀⠿⠿⠛⠛⢻⣿⣿⣆⡀⢻⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡿⠛⢻⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠶⠶⠦ ⣤⣴⣾⣿⣿⣿⣿⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠋⠀⠀⠘⣿⣿⣿⣿⣿⣿⣷⣶⢶⣦⣤⣤⣤⣤⣤⣤⣶⠶⠟⠋⠉⠙⢿⣿⣿⣿⣿⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⣿⡿⠻⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿ ⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠟⠀⠀⠙⠿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻ ⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			},
			-- Add more headers here if you want
		}

		-- Select a random header
		math.randomseed(os.time())
		local selected_header = headers[math.random(#headers)]

		-- Assign the selected header to the dashboard
		db.custom_header = selected_header

		-- Define a custom highlight group for the header
		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#000000", bold = true }) -- Set color here

		-- Assign the highlight group to the header
		vim.cmd([[autocmd User DashboardReady setlocal winhighlight=Normal:DashboardHeader]])

		-- Custom footer
		db.custom_footer = { "Type :q to exit or :Lazy to manage plugins" }

		-- Dashboard buttons
		db.custom_center = {
			{
				icon = "📁  ",
				desc = "Find File          ",
				action = "Telescope find_files",
				shortcut = "SPC f f",
			},
			{
				icon = "🗂️  ",
				desc = "Recent Files       ",
				action = "Telescope oldfiles",
				shortcut = "SPC f o",
			},
			{
				icon = "🔍  ",
				desc = "Find Word          ",
				action = "Telescope live_grep",
				shortcut = "SPC f g",
			},
			{
				icon = "📄  ",
				desc = "New File           ",
				action = "enew",
				shortcut = "SPC c n",
			},
			{
				icon = "🔖  ",
				desc = "Bookmarks          ",
				action = "Telescope marks",
				shortcut = "SPC f m",
			},
			{
				icon = "🔄  ",
				desc = "Update Plugins     ",
				action = "Lazy update",
				shortcut = "SPC p u",
			},
		}

		-- Dashboard setup
		db.setup({
			theme = "doom",
			config = {
				header = db.custom_header, -- Randomly selected ASCII art
				center = db.custom_center, -- Menu options
				footer = db.custom_footer, -- Footer text
			},
		})
		-- Add keybind to open the dashboard
		vim.keymap.set("n", "<leader>dd", ":Dashboard<CR>", { noremap = true, silent = true, desc = "Open Dashboard" })
	end,
}
