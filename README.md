# BetterLorem #

Welcome to BetterLorem -- a better way to generate the famous Lorem Ipsum text for your applications.  Every call to BetterLorem will generate a new transcript based on your parameters -- no two are the same.

This gem works great as a view helper, a lazy attribute for FactoryGirl -- really anywhere you need to call it.


## Getting Started ##

All you need to do is install the Gem:

    gem install betterlorem

BetterLorem will produce a transcript surrounded with HTML p tags.  Use the plain_text parameter to switch it off.


### Usage ###

    BetterLorem.c ( <Number>, <Plain Text>, <Exclude Trailing Period> )  # <- Generate characters
    BetterLorem.w ( <Number>, <Plain Text>, <Exclude Trailing Period> )  # <- Generate words
    BetterLorem.p ( <Number>, <Plain Text>, <Exclude Trailing Period> )  # <- Generate paragraphs

    # Number -     (Optional) Integer - Number of Characters, Words, or Paragraphs to generate.  Defaults to 100 characters, 20 words, or 3 paragraphs.
    # Plain Text - (Optional) Boolean - Exclude the HTML <p></p> tags from the return.  Only includes the Line Ending.
    # Exclude Trailing Period - (Optional) Boolean - Excludes the trailing period from the sentence.  This has no effect on the Character method (BetterLorem.c).

Examples

    BetterLorem.w                  # -> Generate and return 20 words
    BetterLorem.p(10, true, true ) # -> Generate and return 10 paragraphs, in plain text (no HTML tags), excluding the trailing period.
    BetterLorem.c(100)             # -> Generate and return 100 characters and includes HTML (p tags).


### Documentation / Support ###

Not much -- it's pretty simple.

Be sure to check out the Wiki for updates.  If you have a patch, be sure to submit it!


