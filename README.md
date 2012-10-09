# BetterLorem #

Welcome to BetterLorem -- hopefully a better way to generate the famous Lorem Ipsum text for your applications.  This includes a new latin transcript for a fresh look and feel.

## Getting Started ##

All you need to do is install the Gem:

    gem install betterlorem

BetterLorem is not framework dependent, so you can use it in any Ruby 1.9x compatible application.


### Usage ###

    BetterLorem.c ( <Number>, <Line Ending>, <Surround With Tag>, <No_HTML> )  # <- Generate characters
    BetterLorem.w ( <Number>, <Line Ending>, <Surround With Tag>, <No_HTML> )  # <- Generate words
    BetterLorem.p ( <Number>, <Line Ending>, <Surround With Tag>, <No_HTML> )  # <- Generate paragraphs

    # Number - Integer - Number of Characters, Words, or Paragraphs to generate
    # Line Ending - (Optional) String - Character to use to end each paragraph or line.  Defaults to '<br>'.
    # Surround with Tag - (Optional) String - Tag to surround each paragraph with.  Defaults to 'p'.
    # No HTML - (Optional) Boolean - Exclude the HTML tags from the return.  Only includes the Line Ending.

Examples

    BetterLorem.w(100) # -> Generate and return 100 words
    BetterLorem.p(10, "\n", "a" ) # -> Generate and return 10 paragraphs, surrounding each paragraph with <a> tags, ending with a newline.
    BetterLorem.c(100, "-GO-", nil, true) # -> Generate and return 100 characters, ending each line with '-GO-', with no HTML tags.


### Documentation / Support ###

Not much -- it's pretty simple.

Be sure to check out the Wiki for updates.  If you have a patch, be sure to submit it!


