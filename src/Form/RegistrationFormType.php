<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Validator\Constraints as Assert;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'attr' => [
                    'class' => 'mb-2 form-control color-jordan',
                    'minlength' => 5,
                    'maxlength' => 180,
                    'autocomplete' => 'email',
                    'placeholder' => 'user@gmail.com'
                ],
                'label' => 'Adresse email :',
                'label_attr' => [
                    'class' => 'form-label',
                ],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Merci de saisir votre email',
                    ]),
                    new Length([
                        'max' => 180,
                        'maxMessage' => 'Votre adresse email peu contenir un maximum de {{ limit }} caractères',
                    ]),
                    new Email([
                        'message' => 'Merci de saisir une adresse email valide'
                    ])
                ],
            ])
            ->add('agreeTerms', CheckboxType::class, [
                'attr' => [
                    'class' => 'ms-2 form-check-input',
                ],
                'label' => 'Accepter les mentions légales',
                'label_attr' => [
                    'class' => 'form-label'
                ],
                'mapped' => false,
                'constraints' => [
                    new IsTrue([
                        'message' => 'You should agree to our terms.',
                    ]),
                ],
            ])
            ->add('plainPassword', RepeatedType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'type' => PasswordType::class,
                'mapped' => false,
                'invalid_message' => 'Les mots de passe ne correspondent pas',
                'first_options' => [
                    'attr' => [
                        'class' => 'mb-2 form-control color-jordan',
                        'placeholder' => 'Mot de passe',
                    ],
                    'label' => 'Mot de passe :',
                    'label_attr' => [
                        'class' => 'form-label',
                    ],
                    'constraints' => [
                        new NotBlank([
                            'message' => 'Please enter a password',
                        ]),
                        new Length([
                            'min' => 6,
                            'minMessage' => 'Your password should be at least {{ limit }} characters',
                            // max length allowed by Symfony for security reasons
                            'max' => 4096,
                        ]),
                        new Regex([
                            'pattern' => '/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])$/',
                            'message' => 'Votre mot de passe doit contenir au moins une majuscule, un chiffre, un caractère spécial parmi (#?!@$%^&*-), et ne doit pas contenir d’espace.'
                        ])
                    ],
                ],
                'second_options' => [
                    'attr' => [
                        'class' => 'mb-2 form-control color-jordan',
                        'placeholder' => 'Confirmer le mot de passe',
                    ],
                    'label' => 'Confirmer le mot de passe :',
                    'label_attr' => [
                        'class' => 'form-label',
                    ],
                    'constraints' => [
                        new NotBlank([
                            'message' => 'Please enter a password',
                        ]),
                        new Length([
                            'min' => 6,
                            'minMessage' => 'Your password should be at least {{ limit }} characters',
                            // max length allowed by Symfony for security reasons
                            'max' => 4096,
                        ]),
                        new Regex([
                            'pattern' => '/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])$/',
                            'message' => 'Votre mot de passe doit contenir au moins une majuscule, un chiffre, un caractère spécial parmi (#?!@$%^&*-), et ne doit pas contenir d’espace.'
                        ])
                    ],
                ],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}