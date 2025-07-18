<?php

namespace App\Controller;

use App\Entity\Panier;
use App\Entity\PanierProduit;
use App\Entity\Produits;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class PanierController extends AbstractController
{
    #[Route('/panier/ajouter{id}', name: 'add_cart')]
    public function ajouter(Produits $prod, EntityManagerInterface $em, Security $secu): Response
    {
        $user = $secu->getUser();

        $panier = $em->getRepository(Panier::class)->findOneBy(['user'=>$user]) ?? new Panier();
        if (!$panier->getId()) {
            $panier->setUser($user);
            $em->persist($panier);
        }
        
        $panierProduitRepo = $em->getRepository(PanierProduit::class);
        $panierProduit = $panierProduitRepo->findOneBy(['panier'=>$panier, 'produit'=>$prod]);
        
        if ($panierProduit) {
            $panierProduit->setQuantity($panierProduit->getQuantity() + 1);
        }
        else {
            $panierProduit = new PanierProduit();
            $panierProduit->setPanier($panier);
            $panierProduit->setProduit($prod);
            $panierProduit->setQuantity(1);
            $em->persist($panierProduit);
        }

        $em->flush();

        // return $this->render('panier/panier.html.twig', [
        //     'controller_name' => 'PanierController',
        // ]);
        return $this->redirectToRoute('app_panierView');
    }

    #[Route('/panier', name: 'app_panierView')]
    public function panierView(EntityManagerInterface $em, Security $secu): Response
    {
        
        $user = $secu->getUser();
        dump($user);
        $panier = $em->getRepository(Panier::class)->findOneBy(['user'=>$user]);
        
        $panierView = $em->getRepository(PanierProduit::class)->findBy(['panier'=>$panier]);
        dump($panierView);
        
        $total = 0;
        foreach ($panierView as $item) {
            $total += $item->getProduit()->getPrix() * $item->getQuantity();
        }
        
        return $this->render('panier/panier.html.twig', [
            'panierView' => $panierView,
            'total' => $total
        ]);
    }
}