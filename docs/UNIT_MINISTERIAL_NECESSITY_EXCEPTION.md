# Unit review — 関税割当制度政令 art.2(4) ただし書（特に必要な場合の例外 / EXCEPTION）

Normative unit id: `NORM|045b8c69307477e65df2ee80d4b3887e659daa232bf87e787c5475cece2afe69`
Law: `336CO0000000153`, revision `336CO0000000153_20260401_508CO0000000085` (`CurrentEnforced`).
Source: `data/raw/336CO0000000153_20260401_508CO0000000085.law.json`
SHA-256 (CRLF→LF): `81bef06a836f14b4e6f076be5de85026b4131c88fd2277eea91e310676edf27e`
Provision: `LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#4/ParagraphSentence/Sentence#2`

Verbatim (EXCEPTION): 「ただし、農林水産大臣又は経済産業大臣が特に必要があると認めるときは、この限りでない。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | When either minister finds special necessity, the main rule's limit does not apply. Case codes 0 (necessity) → 1 (exception applies); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第二条`. Independent audit: needle whole law = 1, scoped (979 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the exception switch is modelled, not the qualified main rule. |
| U | The qualified main rule and ministerial authority need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `MinisterialNecessityException.lean` — `asException : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `MinisterialNecessityExceptionSpec.lean` — `specAsException c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_exception (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: qualified main rule, ministerial authority, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
