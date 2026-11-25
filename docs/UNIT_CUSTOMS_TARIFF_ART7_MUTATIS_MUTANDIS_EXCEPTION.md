# Unit review — 関税定率法 第七条(15) EXCEPTION / READING / CONDITION

Normative unit id: `NORM|1432e7d9fd592fd3f859fd0bb6be8bf74a4119a191bd87e0ad89bbc16a123d15`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「第七項、第八項（第一号を除く。）及び第九項の規定は、前項の調査が開始された場合について準用する。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#15/ParagraphSentence/Sentence#1`.

Norm kind: **EXCEPTION** (with READING and CONDITION aspects) — paragraphs 7, 8 (except item 1) and 9 apply mutatis mutandis when the preceding paragraph's investigation has begun. Computable slice: the included-provision selection with the item-1 carve-out, and the investigation-started applicability gate. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Included provisions are paragraphs 7, 8 (except item 1), 9; none apply before the investigation begins. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt7MutatisMutandisException.lean. |
| D | PASS — transcription audit 621/621. |
| C | Only the structural selection and gate are modeled. The incorporated provisions' content, their legal effect, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt7MutatisMutandisException.lean` — `Provision` enumeration, `included` Bool selector (item 1 excluded), `applies` gate, six boundary theorems.
- Independent spec: `SpecApplies` Prop (flag set AND provision is neither excluded item 1 nor unenumerated), representationally distinct; equivalence proved by exhaustive `cases` with no `decide`/`simp`/`propext`. All seven unit theorems axiom-free.
- Build: full lake build success (2038 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Incorporated provisions' content, legal effect, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced. The cross-paragraph reading is expressed only within the modeled same-law provision enumeration.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_MUTATIS_MUTANDIS_EXCEPTION.md`.
