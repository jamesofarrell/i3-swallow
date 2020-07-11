#!/usr/bin/env python3

import argparse
import i3ipc
import subprocess
import sys
from threading import Timer
from time import sleep


class I3Swallow(object):

	def __init__(self):
		self.swallowed = False
		self.window_id = self.args = self.cmdargs = self.node = self.process = None
		self.parse_args()
		self.i3 = i3ipc.Connection()

	def run(self):
		self.node = self.i3.get_tree().find_focused()

		self.i3.on("window::new", self.on_window_event)
		if not self.args.d:
			self.i3.on("window::close", self.on_window_event)

		Timer(0.5, self.check_process).start()

		self.process = subprocess.Popen(self.args.cmd + self.cmdargs,
										stdout=subprocess.PIPE)
		self.process.poll()
		if self.process.returncode is not None:
			sys.exit(self.process.returncode)

		self.i3.main()

	def check_process(self):
		self.process.poll()
		if not self.swallowed and self.process.returncode is not None:
			print("i3-swallow: no process attached", file=sys.stderr)
			self.i3.main_quit()

	def on_window_event(self, _, event):
		sleep(0.1)
		self.process.poll()
		if event.change == "new":
			if not self.swallowed and self.process.returncode is None:
				self.node.command("focus; move scratchpad")
				self.window_id = event.container.id
				self.swallowed = True
				if self.args.d:
					self.i3.main_quit()
		elif event.change == "close":
			if self.swallowed and self.process.returncode is not None:
				self.node.command("scratchpad show; floating toggle;")
				sys.exit()

	def parse_args(self):
		parser = argparse.ArgumentParser(description="i3-swallow.")
		parser.add_argument("-d", action="store_true", help="Don't return window on exit.")
		parser.add_argument("cmd", nargs="+", help="Command to be executed")
		self.args, self.cmdargs = parser.parse_known_args()


def main():
	I3Swallow().run()


if __name__ == "__main__":
	main()
