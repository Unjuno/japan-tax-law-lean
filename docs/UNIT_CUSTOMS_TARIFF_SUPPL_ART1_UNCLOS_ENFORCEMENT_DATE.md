# Unit review — 関税定率法 附則第一条 施行期日 REFERENCE (国連海洋法条約 effect)

Normative unit id: `NORM|6290b6ac5ca7107ae51c4755153893adb988f06112ac7e94716dd00aba840ebb`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…986ae9c3.

Verbatim source text (injected from the queue, not hand-typed): 「この法律は、国連海洋法条約が日本国について効力を生ずる日から施行する。」

Exact source position: `LawBody[59]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1` — the whole Paragraph 1 is this sentence. Whole-law locator used because multiple `第一条` nodes exist.

Norm kind: **REFERENCE** — a relative enforcement-date clause: the Act comes into force on the day 国連海洋法条約 takes effect for Japan (効力を生ずる日). No fixed calendar date is stated. All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The Act is in force only when the treaty has taken effect for Japan and the date is on/after that effective date. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffSupplArt1UnclosEnforcementDate.lean. |
| D | PASS — transcription audit 532/532. |
| C | Only the trigger-based in-force condition is modeled. The actual calendar date, treaty content, and legal correctness are out of scope; triggers are caller-established. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffSupplArt1UnclosEnforcementDate.lean` — `inForce` Bool conjunction with three boundary theorems.
- Independent spec: `SpecInForce` Prop conjunction, representationally distinct; `impl_implies_spec` axiom-free (rfl/cases).
- Build: full lake build success (1771 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Actual calendar date, treaty content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced. The 国連海洋法条約 reference is a statutory trigger in the text, NOT MODELLED as a resolved cross-law dependency.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_SUPPL_ART1_UNCLOS_ENFORCEMENT_DATE.md`.
