<?php

namespace App\Controller;

use App\Entity\Produits;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class ShopController extends AbstractController
{
    #[Route('/shop', name: 'app_shop')]
    public function index(EntityManagerInterface $em, Request $req): Response
    {
        $type = $req->query->get('type');
        if ($type && in_array($type, ['Chaussure', 'Vétement'])) {
            $produit = $em->getRepository(Produits::class)->findBy(['type'=>$type]);
        }
        else{
            $produit = $em->getRepository(Produits::class)->findAll();

        }

        return $this->render('shop/shop.html.twig', [
            'controller_name' => 'ShopController',
            'produits' => $produit,
            'type' => $type,
        ]);
    }
}
