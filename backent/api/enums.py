from django.utils.translation import ugettext_lazy as _

CURRENCY_CHF = 'CHF'
CURRENCY_EUR = 'EUR'
CURRENCY_GBP = 'GBP'
CURRENCY_SEK = 'SEK'
CURRENCY_USD = 'USD'

CURRENCY_CHOICES = (
    (CURRENCY_CHF, _("Swiss Francs (CHF)")),
    (CURRENCY_EUR, _("Euros (€)")),
    (CURRENCY_GBP, _("British pound (£)")),
    (CURRENCY_SEK, _("Swedish Krona (kr)")),
    (CURRENCY_USD, _("US Dollars ($)")),
)

EVENT_FORMAT_HOURS = 'hours'
EVENT_FORMAT_SHORT = 'short'
EVENT_FORMAT_MEDIUM = 'medium'
EVENT_FORMAT_LONG = 'long'

EVENT_FORMAT_CHOICES = (
    (EVENT_FORMAT_HOURS, _("A few hours")),
    (EVENT_FORMAT_SHORT, _("A whole day")),
    (EVENT_FORMAT_MEDIUM, _("Two to three days")),
    (EVENT_FORMAT_LONG, _("More than three days")),
)

EVENT_TAG_BEGINNER_FRIENDLY = 'beginner_friendly'
EVENT_TAG_INTERNATIONAL = 'international'
EVENT_TAG_PWD_FRIENDLY = 'pwd_friendly'
EVENT_TAG_UNDERAGE_FRIENDLY = 'underage_friendly'

EVENT_TAG_CHOICES = (
    (EVENT_TAG_BEGINNER_FRIENDLY, _("Beginner friendly")),
    (EVENT_TAG_INTERNATIONAL, _("International")),
    (EVENT_TAG_PWD_FRIENDLY, _("PWD friendly")),
    (EVENT_TAG_UNDERAGE_FRIENDLY, _("Underage friendly")),
)

EVENT_TAG_DICT = {key: value for (key, value) in EVENT_TAG_CHOICES}

LANGUAGE_DE = 'de'
LANGUAGE_EN = 'en'
LANGUAGE_ES = 'es'
LANGUAGE_FR = 'fr'
LANGUAGE_IT = 'it'
LANGUAGE_RU = 'ru'

LANGUAGE_CHOICES = (
    (LANGUAGE_DE, _("German")),
    (LANGUAGE_EN, _("English")),
    (LANGUAGE_ES, _("Spanish")),
    (LANGUAGE_FR, _("French")),
    (LANGUAGE_IT, _("Italian")),
    (LANGUAGE_RU, _("Russian")),
)

LANGUAGES_DICT = {key: value for (key, value) in LANGUAGE_CHOICES}
