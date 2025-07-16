<?php

namespace App\Controller;

use App\Entity\Produits;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(EntityManagerInterface $em): Response
    {
        $produits = $em->getRepository(Produits::class)->findAll();
        return $this->render('home/home.html.twig', [
            'produit' => $produits,
        ]);
    }
}