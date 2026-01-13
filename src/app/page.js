import Image from "next/image";
import styles from "./page.module.css";

export default function Home() {
  return (
    <main>
      <h1>Next js devops deployment</h1>
      <p>Deployed using docker +  github actions + aws ec2</p>
    </main>
  );
}
