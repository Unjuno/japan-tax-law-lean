import JapanTaxLaw.TaxFinance

/-
# LocalTax718_2TwoAnnuityBenefits — pinned clause 「市町村は、同一の特別徴収対象被保険者について老齢等年金給付が二以上ある場合においては、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について国民健康保険税を徴収させるものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 718_2, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|6432ca17b796e65625ade767be7585f3fa431d4b18198c6b72e43adf78ec96fb.
Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:718_2/Article#718_2/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「市町村は、同一の特別徴収対象被保険者について老齢等年金給付が二以上ある場合においては、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について国民健康保険税を徴収させるものとする。」
Scope: ONLY the 同一の特別徴収対象被保険者について老齢等年金給付が二以上 (benefits ≥ 2) lower bound. 政令で定めるところ・一の年金給付の特別徴収手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax718_2TwoAnnuityBenefits

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「市町村は、同一の特別徴収対象被保険者について老齢等年金給付が二以上ある場合においては、政令で定めるところにより、一の老齢等年金給付（以下この節において「特別徴収対象年金給付」という。）について国民健康保険税を徴収させるものとする。」. -/
def inScope (benefits : Nat) : Prop := threshold ≤ benefits

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (benefits : Nat) : Bool := decide (2 ≤ benefits)

end JapanTaxLaw.LocalTax718_2TwoAnnuityBenefits
