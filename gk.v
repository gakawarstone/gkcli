import rand
import cli { Command, Flag }
import os

fn main() {
	mut cmd := Command{
		name: 'cli'
		description: 'An example of the cli library.'
		version: '1.0.0'
	}
	mut ps_cmd := Command{
		name: 'ps'
		description: 'Prints greeting in different languages.'
		usage: '<name>'
		execute: save_password_to_clipboard
	}
	cmd.add_command(ps_cmd)
	cmd.setup()
	cmd.parse(os.args)
}

fn save_password_to_clipboard(cmd Command) ? {
	password := generate_password()
	os.execute('echo -n "$password" | xsel -b -i')
}

fn generate_password() string {
	charset :=	"abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@#%&*_-+?."
	return rand.string_from_set(charset, 64)
}
