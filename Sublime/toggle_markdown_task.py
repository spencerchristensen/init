import sublime
import sublime_plugin


class ToggleMarkdownTaskCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        view = self.view
        new_selections = []

        for region in self.view.sel():
            line_region = view.line(region)
            line_text = view.substr(line_region)
            if "- [ ]" in line_text:
                modified_text = line_text.replace("- [ ]", "- [x]")
                new_selections.append(region)
            elif "- [x]" in line_text:
                modified_text = line_text.replace("- [x]", "- [ ]")
                new_selections.append(region)
            else:
                modified_text = "- [ ] " + line_text
                end_pos = line_region.begin() + len(modified_text)
                new_selections.append(sublime.Region(end_pos, end_pos))

            view.replace(edit, line_region, modified_text)

        view.sel().clear()
        view.sel().add_all(new_selections)
