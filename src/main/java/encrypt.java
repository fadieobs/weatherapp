import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Created by RXLT7121psvm on 14/07/2017.
 */
public class encrypt {
    public static void main(String[] args) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode("fadiemohamed");
        System.out.println(hashedPassword);

    }


}
