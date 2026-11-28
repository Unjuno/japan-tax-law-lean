import JapanTaxLaw.ElectronicTaxCollectionSystem

/-! # ElectronicTaxCollectionSystem spec — 独立定式 (law 403M50000040054 / art.1)

三要素の成立を独立の補助関数 `allThree` にまとめ、税関除外を
`notCustoms` として別に表現する。実装の識別子は使わない。 -/

namespace JapanTaxLaw.ElectronicTaxCollectionSystem

def notCustoms (customsOfficer : Bool) : Bool :=
  if customsOfficer then false else true

def allThree (mofComputer : Bool) (officeIODevice : Bool) (telecomLink : Bool) : Bool :=
  if mofComputer then (if officeIODevice then telecomLink else false) else false

def specQualifies (customsOfficer : Bool) (mofComputer : Bool)
                  (officeIODevice : Bool) (telecomLink : Bool) : Bool :=
  allThree mofComputer officeIODevice telecomLink && notCustoms customsOfficer

example : specQualifies false true true true = true := by decide
example : specQualifies true true true true = false := by decide

/-- 実装と独立仕様の一致: 四つの Bool に対する場合分けのみ、公理なし。 -/
theorem spec_agrees (customsOfficer : Bool) (mofComputer : Bool)
                    (officeIODevice : Bool) (telecomLink : Bool) :
    qualifies customsOfficer mofComputer officeIODevice telecomLink =
      specQualifies customsOfficer mofComputer officeIODevice telecomLink := by
  unfold qualifies specQualifies allThree notCustoms
  cases customsOfficer <;> cases mofComputer <;> cases officeIODevice <;> cases telecomLink <;> rfl

end JapanTaxLaw.ElectronicTaxCollectionSystem
