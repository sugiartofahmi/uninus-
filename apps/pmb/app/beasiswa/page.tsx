'use client';
import { ReactElement } from 'react';
import { NextPage } from 'next';
import { HeroBanner } from '@uninus/components';
import beasiswa1 from '../illustrations/beasiswaunggul.svg';
import beasiswa2 from '../illustrations/beasiswa2.svg';
import beasiswa3 from '../illustrations/beasiswa3.svg';
import Image from 'next/image';
import Link from 'next/link';
const Beasiswa: NextPage = (): ReactElement => {
  const beasiswaList: { name: string; img: string; link: string }[] = [
    {
      name: 'beasiswa unggul',
      img: beasiswa1,
      link: '/beasiswa/beasiswaunggul ',
    },
    {
      name: 'beasiswa berprestasi',
      img: beasiswa2,
      link: '/beasiswa/beasiswaprestasi ',
    },
    {
      name: 'beasiswa mitra nusantara',
      img: beasiswa3,
      link: '/beasiswa/beasiswamitra',
    },
  ];

  return (
    <section className="w-full min-h-screen">
      <HeroBanner heroImages="./foto-mahasiswa-bareng-2.jpg" />
      <div className="w-full h-full p-16 text-center flex justify-center font-bebasNeue">
        <div className="flex flex-col gap-y-16 w-5/6">
          <div className="w-4/5 mx-auto">
            <h1 className="text-center text-secondary-green-5 text-3xl font-bold">
              PILIHAN BERBAGAI BEASISWA TERSEDIA DI UNIVERSITAS ISLAM NUSANTARA
            </h1>
          </div>
          <div className="w-4/5 mx-auto">
            <p className="px-16 text-lg ">
              Beasiswa Nusantara adalah sebuah program beasiswa yang ditawarkan
              oleh Universitas Islam Nusantara untuk membantu mahasiswa
              berprestasi untuk melanjutkan studi ke jenjang yang lebih tinggi.
              Beasiswa ini bertujuan untuk memberikan kesempatan bagi mahasiswa
              untuk mencapai potensinya dan mengembangkan bakat dan minat mereka
            </p>
          </div>
        </div>
      </div>
      <div className="w-full px-14 py-4 h-16 bg-grayscale-2 bg-opacity-20 text-secondary-green-5 capitalize font-bold text-2xl">
        <h2>pilihan beasiswa</h2>
        <div className="h-1 w-28 mt-1 bg-primary-yellow rounded"></div>
      </div>
      <section className="w-full h-full py-16 px-4">
        <div className="grid grid-cols-3 place-items-center">
          {beasiswaList.map((item, idx) => (
            <Link href={item.link} key={idx} className="w-5/6">
              <div className="hover:-translate-y-4 duration-75  aspect-auto">
                <Image className="w-full " src={item.img} alt={item.name} />
              </div>
            </Link>
          ))}
        </div>
      </section>
    </section>
  );
};

export default Beasiswa;