# Unit review — 関税定率法 art.8(2) para.8（調査終了期限）

Normative unit id: `NORM|4034ae765e5c94d4bbd4588b6536d08053f9a82d48e12c78330531a3d78aa234`

Law: 143AC0000000054 (関税定率法), revision
`143AC0000000054_20260601_508AC0000000005`,
snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「前項の調査は、第四項の調査が終了する日までに終了するものとする。」

Exact source position (from the generated queue):
`LawBody[1]/MainProvision/MainProvision[18]/Article:8_2/Article#8_2/Paragraph#8/ParagraphSentence/Sentence#1`.
Norm kind: **EFFECT** (temporal deadline; relative to another investigation's end day).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | art.8(2) para.8 imposes that the preceding paragraph's (para.7) investigation must be completed no later than the day the paragraph-4 investigation ends. Japanese 「…日までに」 includes that day, so the deadline is `endDay ≤ refDay`. Unit: day index; domain Nat. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「関税定率法 art.8(2) para.8…↔ CustomsInvestigationDeadline.lean (endDay ≤ refDay)」 pinned to law 143AC0000000054, article locator 第八条の二, needle with terminal 「。」. Full-file count of the needle is 1 and it is located in Article 8-2 / Paragraph 8. |
| D (decision) | PASS — audit reports `177/177 checks passed`. |
| C (competing interpretation) | 「…日までに」 could be misread as strict-before (`endDay < refDay`); ordinary Japanese legal usage includes the named day, so `≤` is the faithful reading. The preceding-paragraph (para.7) vs paragraph-4 reference was checked against neighboring paragraphs. Only the temporal ordering is modelled — the investigation procedure, substantive anti-dumping-duty rules of art.8(2), other paragraphs and 政令 details are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsInvestigationDeadline.lean` —
  `withinInvestigationDeadline endDay refDay := endDay ≤ refDay`.
- Independent spec: `specWithinInvestigationDeadline endDay refDay := endDay - refDay = 0`
  (truncated Nat subtraction) — deliberately different from the `≤` formulation.
- Kernel proof: `agree_investigation_deadline` proves the equivalence for **all**
  day-index pairs (`Nat.sub_eq_zero_iff_le`), not a finite sample. Boundary theorems
  `deadline_at_reference`, `deadline_one_day_late`, `deadline_extends_to_later_ref`.
- Build: `lake build` → full build success; axiom probe: `propext`/`Quot.sound` only,
  no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The investigation procedure, the substantive anti-dumping duty rules of art.8(2),
the other paragraphs of that article and all 政令 details. This is a computable
slice of one EFFECT norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_CUSTOMS_INVESTIGATION_DEADLINE_8_2_8.md` (H/T/D/C/U per finding).
