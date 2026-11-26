# FULL-COVERAGE adversarial review — MoneyThresholds: FAIL on 9 cap clauses

Auditor: independent general subagent (session ses_de7fdc9b0ffe3bH2hNTpLYj1fn).
Read-only, non-sampled audit over all 261 units in threshold.json.
Not legal advice; not a completeness claim.

## Verdict: FAIL (9 of 261)
SHA 261/261, verbatim token 261/261, contiguous fragment 261/261, no
forbidden proof tokens, both Lean agreement theorems intact.

Nine records failed the threshold parse: `threshold_kanji='〇〇〇'` parses to 0
but the pinned text uses comma-grouped amounts, e.g. 一〇〇、〇〇〇、〇〇〇円
(100,000,000), 一五、〇〇〇、〇〇〇 (15,000,000), 六八、八九六、〇〇〇
(68,896,000). Only the trailing 〇〇〇 group was captured by the collector.

## H/T/D/C/U
H = the captured threshold is the statutory amount.
T = independent Kanji parse of the 9 comma-grouped phrases.
D = FAIL — captured value 0, not the true cap.
C = these nine are not eligibility thresholds at all: the statute says
  「額がX円を超えるときはX円とする」 — a ceiling (cap), i.e. `min amount X`.
U = exact cap values are recoverable from the pinned text; the model assignment
  must change from a threshold predicate to a cap.

## Action
The 9 units are temporarily BLOCKED and reassigned to a dedicated `MoneyCap`
model (`min amount cap`), with their MoneyThresholds axes removed. No
ADVERSARIAL_REVIEW axis is claimed for them. The other 252 units pass all
four checks and keep their full-coverage axis.
