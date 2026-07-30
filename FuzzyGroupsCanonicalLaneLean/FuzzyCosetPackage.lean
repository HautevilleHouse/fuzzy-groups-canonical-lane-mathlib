import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroupPackage

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure FuzzyCosetPackage (F : FuzzySubgroupPackage) (H : FuzzySubgroupPackage) where
  subgroup : H
  member : F.carrier
  cosetMembership : F.carrier → ℝ
  cosetDecomposition : Prop

structure FuzzyCosetEvidence {F H : FuzzySubgroupPackage} (C : FuzzyCosetPackage F H) where
  cosetDecompositionClosed : C.cosetDecomposition

def FuzzyCosetClosed {F H : FuzzySubgroupPackage} (C : FuzzyCosetPackage F H) : Prop :=
  C.cosetDecomposition

theorem fuzzy_coset_closed_from_evidence {F H : FuzzySubgroupPackage}
    (C : FuzzyCosetPackage F H) (E : FuzzyCosetEvidence C) :
    FuzzyCosetClosed C := by
  exact E.cosetDecompositionClosed

end HautevilleHouse
end HautevilleHouse.FuzzyGroupsCanonicalLaneLean