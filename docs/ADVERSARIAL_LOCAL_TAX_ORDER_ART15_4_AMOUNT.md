# Independent adversarial review — 地方税法施行令 art.6の9の2(1)（二千円）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pin hash, located the needle by structural
walk, verified law identity (CabinetOrder), and read the three Lean files plus
the audit check. No repository files were modified by the reviewer.

## Verdict: CONCRETE FINDING F‑1 (false article label) — reproduced and FIXED

The hash, source needle/locator, law identity (地方税法施行令, CabinetOrder),
spec independence, universal proof, boundary theorems and audit check were all
verified sound. But the reviewer found a false statutory-article label of the
same class as earlier wrong-law findings; it was reproduced and fixed before
any completion flag was set.

## F‑1 — False statutory-article label (H/T/D/C/U, FIXED)

- **H:** the three Lean modules label the provision art.6の2(1) (impl header
  even art.6の2(2)); the real provision is art.6の9の2(1), attr Num=6_9_2.
- **T:** structural walk: ArticleTitle=第六条の九の二 contains the needle (count 1);
  the law's actual 第六条の二 (Num=6_2) is 株式会社等の取引の範囲 and contains
  **0** occurrences of the ¥2,000 text. So the executable check could not pass
  by accident — only the human-facing labels were wrong.
- **D: FAIL** on the label (six locations). **Fix applied:** art.6の2 → art.6の9の2
  at impl header/Statutory article, spec header/Statutory article, tests header,
  and the audit comment (the executable `yield` already used the correct locator
  第六条の九の二). Rebuild passed (5 jobs).
- **C:** none plausible — the label was simply wrong.
- **U:** documentation/provenance impact only; kernel proofs and the audit check
  were unaffected.

## PASS items (no finding)

| ID | Item | D |
|---|---|---|
| F2 | pin hash `9bc03b23…dfb17` exact (7,509,563 bytes = INVENTORY); needle count 1; container ArticleTitle=第六条の九の二; 二千円=2,000 | PASS |
| F3 | law identity 地方税法施行令, 昭和二十五年政令第二百四十五号, law_type=CabinetOrder (政令, not 法律), revision matches | PASS |
| F4 | spec genuinely independent (degenerate interval [2000,2000] vs equality); `agree_delegated_amount` universal via subst / Nat.le_refl / Nat.le_antisymm; no sorry/admit/axiom/Classical.choice | PASS |
| F5 | boundary theorems correct (at_delegated rfl; below/above `decide` on closed goals — kernel-sound) | PASS |
| F6 | audit check pinned to law 325CO0000000245, locator 第六条の九の二, full needle; 189/189 PASS for the right reason | PASS |

## Interpretive notes (C/U) — not findings

- 「政令で定める金額は、二千円とする」 = definitional amount-fixing → equality
  faithful. The ¥2,000 is a statutory threshold constant referenced by
  地方税法 art.15-4(1); extracting only ¶1's constant is a legitimate slice,
  explicitly disclaimed (impl/spec/docs). DELEGATION is a reasonable taxonomy.
- **U:** the defined-term label and substantive art.15-4(1) content are out of
  scope; consumers must not read `isDelegatedAmount` as an applicability rule.

## F‑2 — dangling adversarial-doc reference (FIXED)

The unit doc referenced `docs/ADVERSARIAL_LOCAL_TAX_ORDER_ART15_4_AMOUNT.md`
before it existed; this file now provides it.

## Closing

No soundness break, wrong pin, transcription error, circular proof, or law-label
error remains. No claim of legal correctness; human legal review remains
`LEGAL_REVIEW_PENDING`.
