import JapanTaxLaw.TaxFinance

/-
# ReadingSubstitutionMunicipal — 公共サービス実施民間事業者省令 第三条（「市又は区若しくは総合区」→「区又は総合区」読替え）

Pinned source:
  Law id: 418M60000008099
  Revision: 418M60000008099_20240401_505M60000008106
  Raw snapshot: data/raw/418M60000008099_20240401_505M60000008106.law.json
  sha256 (raw bytes): c4b5784d5131dac1c93167ffb523688ad889586483a148504af730ede9af2e10
  Normative unit id: NORM|86a625f4a0733597f47e3f2575103fee40b62748885af002076f1933959a34f4
  Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/
               Paragraph#2/ParagraphSentence/Sentence#2
  Statutory article: 第三条 第2項 (READING / 読み替え)

原文逐語（pinned, 一字一句改変なし）:
  「この場合において、前項中「市又は区若しくは総合区」とあるのは、「区又は総合区」と読み替えるものとする。」

Variable contract:
  `p : Phrase` is the phrase appearing in 前項 (paragraph 1) of 第三条. This is a
  読替え (textual reading-substitution) norm, NOT a numeric condition: there is
  no threshold, count, rate or arithmetic anywhere in the rule. The phrase set
  is exactly {cityOrWardOrGeneralWard, wardOrGeneralWard, other}:
    - cityOrWardOrGeneralWard = 「市又は区若しくは総合区」 (前項 original, city-inclusive)
    - wardOrGeneralWard       = 「区又は総合区」 (substituted, city-exclusive)
    - other                   = an unrelated phrase (identity case)
  `readingSubstitute` rewrites only the city-inclusive phrase to the
  city-exclusive one; the city-exclusive phrase and all unrelated phrases are
  unchanged. Applying the rule twice is the same as applying it once.
  All data are enumerated constructors; no Nat/Bool numeral appears in the rule.

Scope: only the explicit reading substitution in the relevant clause. The
  triggering condition 「この場合において」, the substantive delivery/reporting
  rules of paragraphs 1 and 2, the rest of the ordinance and other articles are
  NOT MODELLED. This is a computable slice of one norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.ReadingSubstitutionMunicipal

/-- The phrase set at issue in the 読み替え of 第三条第2項. -/
inductive Phrase where
  | cityOrWardOrGeneralWard  -- 「市又は区若しくは総合区」 (前項 original, city-inclusive)
  | wardOrGeneralWard        -- 「区又は総合区」 (substituted, city-exclusive)
  | other                    -- unrelated phrase (identity case)
  deriving BEq, DecidableEq

/-- The reading-substitution: only the city-inclusive phrase is rewritten;
    the city-exclusive phrase and any unrelated phrase are unchanged. -/
def readingSubstitute (p : Phrase) : Phrase :=
  match p with
  | Phrase.cityOrWardOrGeneralWard => Phrase.wardOrGeneralWard
  | Phrase.wardOrGeneralWard => Phrase.wardOrGeneralWard
  | Phrase.other => Phrase.other

/-- Idempotence: substituting twice equals substituting once. -/
theorem readingSubstitute_idempotent (p : Phrase) :
    readingSubstitute (readingSubstitute p) = readingSubstitute p := by
  cases p <;> rfl

end JapanTaxLaw.ReadingSubstitutionMunicipal
