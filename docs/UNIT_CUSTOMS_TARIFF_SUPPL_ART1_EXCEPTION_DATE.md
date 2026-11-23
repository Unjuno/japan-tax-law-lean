# Unit review — 関税定率法 附則第一条 (施行期日) EXCEPTION

Normative unit id: `NORM|34bc97d6d32588ad832ab14de19ae658b3d7e00e7bb4bacc59564498bfe859c3`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…986ae9c3.

Verbatim source text (injected from the queue, not hand-typed): 「ただし、次に掲げる規定は、平成四年一月一日から施行する。」
Enclosing sentence (both dates, resolved from raw JSON): 「この法律は、平成三年四月一日から施行する。ただし、次に掲げる規定は、平成四年一月一日から施行する。」

Exact source position: `LawBody[50]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#2` — the ただし (however) sentence of 附則第一条, overriding the general enforcement date for the provisions listed next.

Norm kind: **EXCEPTION** — the ただし clause. Both enforcement dates (平成3年4月1日 general, 平成4年1月1日 exception) were parsed programmatically from the verbatim source via kanji-numeral parsing; no hand-typed statutory strings.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Listed provisions (次に掲げる規定) take the exception date 平成4年1月1日; other provisions take the general date 平成3年4月1日. The exception date is later. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffSupplArt1ExceptionDate.lean (needle = Sentence#2). |
| D | PASS — transcription audit 472/472. |
| C | Only date selection and within-era ordering modeled. The identity of the listed provisions themselves, cross-era conversion, other supplementary provisions, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffSupplArt1ExceptionDate.lean` — `Date` (era-year/month/day), `generalDate=⟨3,4,1⟩`, `exceptionDate=⟨4,1,1⟩`, `ProvisionKind`, `applicableDate` (override for listed), `leDate`, `inForceOn`, five theorems.
- Independent spec: `SpecApplicableDate` Prop equality-disjunction, representationally distinct; `spec_listed/other` and `impl_*_matches_spec` axiom-free.
- Build: full lake build success (1552 jobs); all nine unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
The listed provisions themselves, cross-era conversion, legal correctness.

## Dependencies (honest)
The queue records one `enforcement_version` dependency with `resolution=textual` and `sufficient=false`. It is a within-law temporal reference fixed by the pinned 関税定率法 enforcement version; no external-law constant is introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_SUPPL_ART1_EXCEPTION_DATE.md`.
